# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = [
   {
      :hostname => "dns1.vagrant",
      :ips => [ "172.16.16.3" ],
   },
   {
      :hostname => "ipam1.vagrant",
      :ips => [ "172.16.16.11" ],
   },
]

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  if Gem::Version.new(Vagrant::VERSION) >= Gem::Version.new("1.6")
      config.ssh.insert_key = false
  end

  if Vagrant.has_plugin?('vagrant-hostmanager')
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
  else
    raise "** Install vagrant-hostmanager plugin `vagrant plugin install vagrant-hostmanager`.**\n"
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.enable :apt
  end

  config.vm.provider :virtualbox do |vb|
    # for troubleshooting cloud-init/vagrant/ubuntu issue (https://github.com/mitchellh/vagrant/issues/3860)
    # vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", 512]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # This errs out in the "get rid of stdin-not-a-tty warning" task with the error message
  # "Destination /root/.profile does not exist", but works when run from the command line.  This
  # might be an ansible version issue (which version of ansible does vagrant use?).
  config.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "inventory/vagrant"
    ansible.playbook = "vagrant-provision.yml"
  end

  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.hostname = node[:hostname]

      if node.has_key?(:ips)
        node[:ips].each do |ip|
          node_config.vm.network :private_network, ip: ip
        end
      end
      if node.has_key?(:aliases)
        node_config.hostmanager.aliases = node[:aliases]
      end
    end
  end

end
