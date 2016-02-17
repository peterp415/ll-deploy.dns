# Deploys LL DNS infrastructure

## Summary

Mostly consisting for ipam management and bind roles for deploying dns.

## Getting started
Deps: 
1) ansible: 
  - `sudo apt-get install virtualenvwrapper`
  - `virtualenv ansible; source ansible/bin/activate`
  - `pip install -r requirements.txt`
2) ansible-galaxy shared roles
  - `ansible-galaxy install -r requirements.yml -p shared-roles --force`
3) vagrant:
  - download at [http://www.vagrantup.com/downloads](http://www.vagrantup.com/downloads)
  - `vagrant plugin install vagrant-hostmanager`: this allows us to avoid munging ansible inventory
    files with ips and ports.
  - `vagrant plugin install vagrant-cachier`: this hopefully keeps us from hammering ubuntu repos,
    although it seems to have some race conditions when multiple vagrants are using it
    simultaneously.  It also leads to confusing behavior on non-vagrant-initiated reboot
    (/tmp/vagrant-cache goes missing in the virt, possible workarounds are at
    https://github.com/mitchellh/vagrant/issues/5199).
  - `vagrant up`

Setup vagrant env:
  - `vagrant provision` OR `ansible-playbook -i inventory/vagrant vagrant-provision.yml`

Deploy
  - `ansible-playbook -i <inventory> deploy.yml`

## Project Documentation

- https://jira.locationlabs.com/browse/IG-1518 
- https://confluence.locationlabs.com/display/INFRA/DNS+Improvement

HQ is already being deployed via Joe's dnsdeploy
- git@git.locationlabs.com:dnsdeploy
