DNS Monitoring
==============

This role installs DNS service monitoring for use with the consul/nagios monitoring solution

Requirements
------------

The role uses the Nagios plugin `check_dns` to verify that DNS service is responding to requests.  Plugin packages are installed to support this.

Role Variables
--------------

`check_dns` takes two timeout values, defined as variables for this role:

- `monitor_dns_warn_timeout` DNS response timeout warning threshold, default 5 seconds
- `monitor_dns_crit_timeout` DNS response timeout critical threshold, default 25 seconds

`check_dns` is set up to make its DNS requests against localhost, querying for the local host name using the `ansible_fqdn` variable.

Dependencies
------------

This role is intended to be used as part of an existing `consul` monitoring setup.

Example Playbook
----------------

For example:

    - hosts: servers
      roles:
         - { role: monitor_dns, tags: ['check_dns'] }
