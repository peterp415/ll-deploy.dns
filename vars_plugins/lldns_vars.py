from __future__ import (absolute_import, division, print_function)
from ansible.utils.vars import combine_vars
__metaclass__ = type


class VarsModule(object):

    """
    Loads variables for groups and/or hosts
    """
    def __init__(self, inventory):
        self.inventory = inventory

    def expand_group (self, parent, groups=None):
        """
        Recursively returns a list of all child groups of a group
        This should probably not be used
        """
        if groups == None: 
            groups = []
        for group in parent.child_groups:
            groups.append (group)
            if group.child_groups:
                self.expand_group (group,groups)
            else:
                groups.append (group)
        return groups
        
    def get_clusters (self, parent, clusters=None):
        """
        Return a dictionary of all clusters within a group.
        Key is name. Value is group object
        """
        if clusters == None: 
            clusters = {}
        if not parent.child_groups: #FIXME: kludge
            clusters[parent.name]=parent
        else:
            for group in parent.child_groups:
                if group.child_groups:
                    self.get_clusters (group,clusters)
                else:
                    clusters[group.name]=group
        return clusters

    def get_legacy_hostvars (self, host):
        """
        Return Ansible 1.9-style hostvars for a host
        """
        return combine_vars (host.get_group_vars(), host.get_vars())

    def get_world_group (self, host):
        """
        Returns the group object for the dns world of a host
        """
        hostvars = self.get_legacy_hostvars (host)
        world_name = hostvars['dns_world']
        world_group = None
        for group in host.get_groups():
            if group.get_name() == world_name:
                world_group = group
                break
        if (not world_group):
            raise Exception ('Host {} has no DNS world'.format(hostvars['inventory_hostname']))
        return world_group

    def get_world_groups (self, host):
        """
        Returns a list of group objects in the same DNS world as a host
        """
        world_group = self.get_world_group(host)
        return self.expand_group (world_group)

    def get_world_hosts (self, host):
        """
        Returns a list of host objects in the same DNS world as host
        """
        world_group = self.get_world_group (host)
        return world_group.get_hosts()
    
    def get_host_by_bind_ip (self, host, ip):
        """
        Return a host object matching a bind_ip or None if none exists
        """
        world_hosts = self.get_world_hosts (host)
        for world_host in world_hosts:
            if world_host.get_vars()['bind_ip'] == ip:
                return world_host
        return None #FIXME

    def is_cluster (self, group):
        """
        Returns True if host is a cluster, otherwise False
        FIXME: is this needed?
        """
        if (group.child_groups):
            return False
        else:
            return True if 'master' in group.get_vars() else False
    
    def get_master_zones (self, host):
        """
        Get zones for which a host is master. This is the contents of master_zones
        if the host is master for the cluster, or otherwise empty.
        Returns list of zones, each entry a dict with key: name, value zone
        """
        master_zones = []
        hostvars = self.get_legacy_hostvars (host)
        if (('master' in hostvars) and
            ('master_zones' in hostvars) and
            (hostvars['master'] == hostvars['inventory_hostname'])):
            for zone in hostvars['master_zones']:
                zone_dict = { 'name' : zone }
                master_zones.append(zone_dict)
        return master_zones

    def is_master (self, host, zone):
        """
        Returns True if host is master for a zone, else False
        """
        master_zones = self.get_master_zones (host)
        for master_zone in master_zones:
            if master_zone['name'] == zone:
                return True
        return False

    def merge_bind_config_zone (self, host, zone_var, zone_dict):
        """
        Merge content into bind_config_*_zones hostvar
        FIXME This has unusual behavior that should be fixed or documented
        """
        vars = host.get_vars()
        bind_config_zones = vars.get(zone_var,[])
        bind_config_zone = {}
        zone_index = None
        for index in range (0, len(bind_config_zones)):
            mzone = bind_config_zones[index] #FIXME: unhelpful name
            if mzone['name'] == zone_dict['name']:
                zone_index = index
                bind_config_zone = mzone
                break;
        for key in zone_dict:
            bind_config_zone.setdefault(key, zone_dict[key])
        bind_config_zone.setdefault('allow_transfer', [])
        if 'allow_transfer' in zone_dict:
            for ip in zone_dict['allow_transfer']:
                if ip not in bind_config_zone['allow_transfer']:
                    bind_config_zone['allow_transfer'].append(ip)
        if zone_index != None:
            bind_config_zones[zone_index] = bind_config_zone
        else:
            bind_config_zones.append(bind_config_zone)
        host.set_variable(zone_var, bind_config_zones)
        return None

                    
    def allow_xfer (self, from_host, to_host, zone):
        """
        Inject configuration to allow-transfer
        FIXME: Has other evil behavior and makes assumptions re: 1 zone per zonedef
        Actually this latter defect should be fixed in the merge "function"
        """
        masterp=self.is_master (from_host, zone)
        from_vars=from_host.get_vars()
        to_vars=to_host.get_vars()
        zones_var = 'bind_config_master_zones' if masterp else 'bind_config_slave_zones'
        zone_dict = { 'allow_transfer' : [to_vars['bind_ip']],
                       'name' : zone,
                       'zones' : [zone] }
        self.merge_bind_config_zone (from_host, zones_var, zone_dict)

    def expand_zonedef (self, host, root):
        """
        Return a list of DNS zones given an input.
        If this is already a DNS zone, return value is [root]
        If it is the name of a host group, return all zones mastered somewhere
        in that group
        """
        world_groups = self.get_world_groups (host)
        zones = []
        for group in world_groups:
            if group.get_name() == root:
                clusters = self.get_clusters (group)
                for cluster in clusters:
                    cluster_vars = clusters[cluster].get_vars()
                    if 'master_zones' in cluster_vars:
                        for zone in cluster_vars['master_zones']:
                            zones.append (zone)
        if not zones:
            zones = [root]
        return zones

    def get_slave_zones (self, host):
        """
        Get zones slaved by a host.
        Returns dictionary with zone as key and list of IPs as value
        This requires for now that the slaving source specification be a
        cluster
        """
        hostvars = self.get_legacy_hostvars (host)
        master_zones = hostvars['master_zones'] if 'master_zones' in hostvars else []
        slave_zones = []
        if 'slave_zones' in hostvars:
            for source in hostvars['slave_zones']:
                slave_def = {'name':'', 'masters':[], 'zones':[]} 
                source_ips = []
                for server in self.inventory.get_group(source).get_hosts(): #FIXME input validation
                    source_ips.append (server.get_vars()['bind_ip']) #FIXME error checking
                zonedefs = (hostvars['slave_zones'])[source]
                for zonedef in zonedefs:
                    zones = self.expand_zonedef (host, zonedef)
                    for zone in zones:
                        if zone not in master_zones:
                            slave_def['masters'] = source_ips
                            slave_def['zones'] = [zone]
                            slave_def['name'] = zone
                            slave_zones.append (slave_def)
        if hostvars['master'] != hostvars['inventory_hostname']:
            for zone in master_zones:
                master_ip = self.inventory.get_host(hostvars['master']).get_vars()['bind_ip']
                slave_zones.append ({'name':zone, 'zones':[zone], 'masters':[master_ip]})
        return slave_zones

    def inject_allow_xfers (self, host, slave_zones):
        for slave_zone in slave_zones:
            for master_ip in slave_zone['masters']:
                master_host = self.get_host_by_bind_ip (host, master_ip)
                self.allow_xfer (master_host, host, slave_zone['name'])
        return None #FIXME
    
    def run(self, host, vault_password=None):
        hostvars = self.get_legacy_hostvars (host)
        output = {}
        if 'dns_world' not in hostvars: #FIXME
            return {}
        dns_world = hostvars['dns_world']
        root = self.inventory.get_group(dns_world)
        clusters = self.get_clusters (root)
        self.get_world_groups (host)
        host_master_zones = self.get_master_zones (host)
        host_slave_zones = self.get_slave_zones (host)
        self.inject_allow_xfers (host, host_slave_zones)
        for zone in host_slave_zones:
            self.merge_bind_config_zone (host, 'bind_config_slave_zones', zone)
        return {"lldns" : clusters,
                "host_master_zones" : host_master_zones}
                #bind_config_slave_zones" : host_slave_zones }

    def get_host_vars(self, host, vault_password=None):
        return {}

    def get_group_vars(self, group, vault_password=None):
        return {}
