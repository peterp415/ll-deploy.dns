from __future__ import (absolute_import, division, print_function)
from ansible.utils.vars import combine_vars
__metaclass__ = type


class VarsModule(object):

    """
    Loads variables for groups and/or hosts
    """
    def __init__(self, inventory):
        self.inventory = inventory
                    
    def expand_group (self, parent, clusters=None):
        if clusters == None: 
            clusters = {}
        for group in parent.child_groups:
            if group.child_groups:
                self.expand_group (group,clusters)
            else:
                clusters[group.name]={}
        return clusters

    def get_master_zones (self, hostvars):
        """
        Get zones for which a host is master. This is the contents of master_zones
        if the host is master for the cluster, or otherwise empty.
        Returns dictionary with zone as key and list of IPs to notify as value
        """
        master_zones = {} 
        if (('master' in hostvars) and
            ('master_zones' in hostvars) and
            (hostvars['master'] == hostvars['inventory_hostname')):
            for zone in hostvars['master_zones']: #FIXME evil indentation
                master_zones[zone] = '127.0.0.1' #FIXME
        return master_zones

    def get_slave_zones (self, host):
        """
        Get zones slaved by a host.
        Returns dictionary with zone as key and list of IPs as value
        """
        return {}
    
    def run(self, host, vault_password=None):
        # FIXME: The following is a kluge around changes in Ansible 2.0
        # Probably there is a more idiomatic way to do this
        hostvars = combine_vars (host.get_group_vars(), host.get_vars())
        output = {}
        dns_world = hostvars['dns_world']
        root = self.inventory.get_group(dns_world)
        clusters = self.expand_group (root)
        host_master_zones = self.get_master_zones (host)
        host_slave_zones = self.get_slave_zones (host)
        return {"lldns" : clusters,
                "host_master_zones" : host_master_zones,
                "host_slave_zones" : host_slave_zones }

    def get_host_vars(self, host, vault_password=None):
        return {}

    def get_group_vars(self, group, vault_password=None):
        return {}
