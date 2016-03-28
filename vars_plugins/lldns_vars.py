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
        Returns dictionary of zones for which host is master. Value of dictionary
        entries for now is [] (empty list)
        """
        master_zones = {}
        hostvars = self.get_legacy_hostvars (host)
        if (('master' in hostvars) and
            ('master_zones' in hostvars) and
            (hostvars['master'] == hostvars['inventory_hostname'])):
            for zone in hostvars['master_zones']:
                master_zones[zone] = [] #FIXME
        return master_zones

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
        slave_zones = {}
        if 'slave_zones' not in hostvars:
            return {}
        else:
            for source in hostvars['slave_zones']:
                source_ips = []
                for server in self.inventory.get_group(source).get_hosts(): #FIXME
                    source_ips.append (server.get_vars()['bind_ip']) #FIXME error checking
                zonedefs = (hostvars['slave_zones'])[source]
                for zonedef in zonedefs:
                    zones = self.expand_zonedef (host, zonedef)
                    for zone in zones:
                        slave_zones[zone] = source_ips
        return slave_zones
    
    def run(self, host, vault_password=None):
        hostvars = self.get_legacy_hostvars (host)
        output = {}
        dns_world = hostvars['dns_world']
        root = self.inventory.get_group(dns_world)
        clusters = self.get_clusters (root)
        self.get_world_groups (host)
        host_master_zones = self.get_master_zones (host)
        host_slave_zones = self.get_slave_zones (host)
        return {"lldns" : clusters,
                "host_master_zones" : host_master_zones,
                "host_slave_zones" : host_slave_zones }

    def get_host_vars(self, host, vault_password=None):
        return {}

    def get_group_vars(self, group, vault_password=None):
        return {}
