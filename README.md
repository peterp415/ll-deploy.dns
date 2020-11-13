# DNS Deployment for Infrastructure

## Summary

This project uses a host inventory and bind role for deploying a dns
server environment and an ipam management server.

Currently there is a Vagrant environment for local testing and a staging environment for EVDC servers.

Note that the bind configuration and zone files are verified during deployment by running
`named-checkconf` and `named-checkzone` on them before they are copied into place on the servers.
However running a playbook with the `--check` option does not let these tests run, since no files are
actually deployed.

## Getting started

1. Create/activate a virtualenv for the project:

        mkvirtualenv dns

2. Install the python requirements (ansible):

        pip install -r requirements.txt

2a. If you run into problems with installing the requirements, you may need these:

	sudo apt-get install build-essential libssl-dev libffi-dev python-dev

3. Install Ansible requirements (shared roles):

        ansible-galaxy install -r requirements.yml -p shared-roles --force


## Vagrant

1. Bring up the Vagrant instances:

        vagrant up

   Note that Vagrant provisioning copies `.ssh/authorized_keys` from the `vagrant` user into `/root`
   and runs an apt update.

2. Invoke ansible to deploy bind systems:

        ansible-playbook -e 'bind_masterzones_local_path=masters.vagrant' -i inventory/vagrant/inventory deploy.yml

## Staging or Production Environments Deploys

We currently have several environments defined for this deploy:

| environment  | Description                       | Servers                                            |
| ------------ | --------------------------------- | -------------------------------------------------- |
| vagrant      | Vagrant test silos                | ns{1,2}.{common,aci}.sfdc.vagrant                  |
| staging      | Silo simulation w/monitoring      | ns{1,2}-{aci,common,pub}.evdc                      |
| staging-test | Simple test pair w/monitoring     | ns{1,2}-evdc.evdc                                  |
| evdc-and-hq  | Production EVDC and HQ            | ns{1,2}.evdc and ns{1,2}.engr                      |
| sfdc         | Production SFDC                   | ns{1,2}.{,common,aci,tfw,sfp}.sfdc             |
| sfdc-public  | (Old) SFDC Public Production      | ns{1,2}.wavemarket.com                             |
| atl2-public  | Public Production out of ATL2     | public-dns-ns1 instance in ig-prod project         |

1. Set up the deploy environment (if needed) by configuring:

   - Groups of servers in `inventory/<environment>/inventory`
   - Master zone servers and zone slaving relationships in `inventory/<environment>/group_vars/<group>`

2. Invoke ansible to deploy bind systems:

        ansible-playbook -i inventory/<environment>/inventory deploy.yml

3. Deploy Consul monitoring agents.  This currently needs Ansible 1.9 and
   a separate `ansible.cfg` that excludes the vars plugin:

        mkvirtualenv ansible19
        pip install ansible==1.9.4
        ANSIBLE_CONFIG=consul_ansible.cfg ansible-playbook -i inventory/<environment>/inventory consul_deploy.yml

### EVDC and HQ DNS Zone File Deploy

See https://confluence.locationlabs.com/pages/viewpage.action?pageId=5689710 for the correct procedure.

The gist is:

1. Get zone data and make your changes in `ig/data.dns-zones/EVDC-HQ`

Navigate to the dns deploy, and run the following check.  Be sure to replace the zone_data path "../../data/dns-zones/EVDC-HQ" with whats correct for your local machine:

    ansible-playbook --tags bind-zones -e 'bind_masterzones_local_path=../../data/dns-zones/EVDC-HQ' -i inventory/evdc-and-hq/inventory deploy.yml --check --diff

If the check is successful, run the following to deploy zone data:

    ansible-playbook --tags bind-zones -e 'bind_masterzones_local_path=../../data/dns-zones/EVDC-HQ' -i inventory/evdc-and-hq/inventory deploy.yml

### SFDC Zone File Deploy

See https://confluence.locationlabs.com/pages/viewpage.action?pageId=6521220

The gist is:

1. Get zone data and make your changes in `ig/data.dns-zones/SFDC`

Navigate to the dns deploy, and run the following check.  Be sure to replace the zone_data path "../../data/dns-zones/SFDC" with whats correct for your local machine:

    ansible-playbook --tags bind-zones -e 'bind_masterzones_local_path=../../data/dns-zones/SFDC' -i inventory/sfdc/inventory deploy.yml --check --diff

If the check is successful, run the following to deploy zone data:

    ansible-playbook --tags bind-zones -e 'bind_masterzones_local_path=../../data/dns-zones/SFDC' -i inventory/sfdc/inventory deploy.yml

### Public Zone File Deploy

See https://confluence.locationlabs.com/pages/viewpage.action?pageId=6521220

The gist is:

1. Get zone data and make your changes, in `ig/data.dns-zones/ATL2-PUBLIC`

Navigate to the dns deploy, and run the following check.  Be sure to replace the zone_data path "../../data/dns-zones/ATL2-PUBLIC" with whats correct for your local machine:

    ansible-playbook --tags bind-zones -e 'bind_masterzones_local_path=../../data/dns-zones/ATL2-PUBLIC' -i inventory/atl2-public/inventory deploy.yml --check --diff

If the check is successful, run the following to deploy zone data:

    ansible-playbook --tags bind-zones -e 'bind_masterzones_local_path=../../data/dns-zones/ATL2-PUBLIC' -i inventory/atl2-public/inventory deploy.yml

## Project Documentation

* https://jira.locationlabs.com/browse/IG-1518
* https://confluence.locationlabs.com/display/INFRA/DNS+Improvement

## Implementation

### Vagrant and Plugins

Download Vagrant at [http://www.vagrantup.com/downloads](http://www.vagrantup.com/downloads)

The vagrant environment utilizes two plugins:

* hostmanager
* cachier

[Hostmanager](https://github.com/smdahlen/vagrant-hostmanager) is a required plugin that edits both the host and guest /etc/hosts file to allow easier access to the vagrants via a FQDN.

Install with `vagrant plugin install vagrant-hostmanager`

[Cachier](https://github.com/fgrehm/vagrant-cachier) is an optional plugin that simply caches apt packages to help speed up the vagrant provision step.

Note that Cachier seems to have some race conditions when multiple vagrants are using it
simultaneously.  It also leads to confusing behavior on non-vagrant-initiated reboot
(/tmp/vagrant-cache goes missing in the virt, possible workarounds are at
https://github.com/mitchellh/vagrant/issues/5199).

### BIND Host Troubleshooting

See

* http://www.zytrax.com/books/dns/ch8/
* https://help.ubuntu.com/lts/serverguide/dns-troubleshooting.html

Look in configuration and data files:

* /etc/bind/name.conf{,local.master,local.slave,options}
* /var/lib/bind/masters/db.*
* /var/lib/bind/slaves/db.*

Look in `/var/log/syslog`

Use named-checkconf

Check zone updates and propagation
e.g.:

    # dig @localhost -t soa +short sfdc.vagrant
    ns1.sfdc.vagrant. hostmaster.sfdc.vagrant. 2016010100 86400 7200 1209600 172800

and `query-zone-serials*.sh`

Convert binary slave zone files to text:

    zone=evdc.wavemarket.com
    named-compilezone -f raw -F text -o - ${zone} /var/lib/bind/slaves/db.${zone}


To Configure BIND Logging
=========================
In `/etc/bind/named.conf.local`:

    logging {
        channel query.log {
            file "/var/log/named/query.log";
            severity debug 3;
        };
        category queries { query.log; };
    };

Then:

    mkdir /var/log/named
    chown bind /var/log/named
    service bind9 restart
