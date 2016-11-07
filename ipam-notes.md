# IPAM Tool Notes

## Summary

These are some notes on initial experiments with an IPAM tool, phpipam.

## phpipam notes

Picking up Irwin's work in ~/Projects/dns-and-ipam/ig/deploy/ipam
ig/deploy/ipam develop

TODO: move this into a role (clobber the nipap ansible/roles/ipam) and use with ig/deploy/dns
Do this as IG-1674

Running from ig/deploy/dns with shared-roles/ipam -> ~/Projects/dns-and-ipam/ig/deploy/ipam

    cd ~/Projects/dns-and-ipam/ig/deploy/dns
    rm shared-roles/ipam
    ln -s ~/Projects/dns-and-ipam/ig/deploy/ipam shared-roles/ipam
    vagrant up ipam1.vagrant
    ansible-playbook -i inventory/vagrant/inventory deploy-ipam.yml

TODO:

* Make a standalone Vagrant deploy in the role?

### Deploy

deploy-ipam.yml:

    ---

    - name: deploy ipam
      hosts: ipam
      remote_user: root
      roles:
       - ipam
      tags:
       - ipam


### Data Import/Export

This is in ticket comments in IG-1520 and IG-1521

Import BIND zone files, see dnspython: http://www.dnspython.org/examples.html

Export records with templating, see https://github.com/SpriteLink/NIPAP/tree/v0.28.4/utilities/export-template.py


