# DNS Deployment for Infrastructure

## Summary

This project uses a host inventory and bind role for deploying a dns
server environment and an ipam management server.

Currently there is a Vagrant environment for local testing and a staging environment for EVDC servers.

## Getting started

1. Create/activate a virtualenv for the project:

        mkvirtualenv dns

2. Install the python requirements (ansible):

        pip install -r requirements.txt

3. Install Ansible requirements (shared roles):

        ansible-galaxy install -r requirements.yml -p shared-roles --force

## Vagrant

1. Bring up the Vagrant instances:

        vagrant up

   Note that Vagrant provisioning copies `.ssh/authorized_keys` from the `vagrant` user into `/root`
   and runs an apt update.

2. Invoke ansible to deploy bind and ipam systems:

        ansible-playbook -i inventory/vagrant/inventory deploy.yml

## Staging (EVDC)

1. Set up the staging environment by configuring servers in `inventory/staging/inventory`
   and `inventory/staging/{host,group}_vars/`

2. Invoke ansible to deploy bind and ipam systems:

        ansible-playbook -i inventory/staging/inventory deploy.yml

## Project Documentation

* https://jira.locationlabs.com/browse/IG-1518
* https://confluence.locationlabs.com/display/INFRA/DNS+Improvement

HQ is already being deployed via Joe's dnsdeploy:
* git@git.locationlabs.com:dnsdeploy

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
