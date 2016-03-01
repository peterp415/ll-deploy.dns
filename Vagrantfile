# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = [
  { :hostname => "ipam1.vagrant",           :ips => [ "172.16.16.5"  ], },
  { :hostname => "ns1.common.sfdc.vagrant", :ips => [ "172.16.16.11" ], },
  { :hostname => "ns2.common.sfdc.vagrant", :ips => [ "172.16.16.12" ], },
  { :hostname => "ns1.aci.sfdc.vagrant",    :ips => [ "172.16.16.21" ], },
  { :hostname => "ns2.aci.sfdc.vagrant",    :ips => [ "172.16.16.22" ], },
]

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false

  if Vagrant.has_plugin?('vagrant-hostmanager')
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.include_offline = true
  else
    raise "** Install vagrant-hostmanager plugin `vagrant plugin install vagrant-hostmanager`.**\n"
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.enable :apt
  end

  # Use a standard box for all
  config.vm.box = "bento/ubuntu-14.04"

  config.vm.provider :virtualbox do |vb|
    # for troubleshooting cloud-init/vagrant/ubuntu issue (https://github.com/mitchellh/vagrant/issues/3860)
    # vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", 256]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
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
      node_config.vm.provision "shell",
        inline: "mkdir -p /root/.ssh ;" +
                "cat /home/vagrant/.ssh/authorized_keys >> /root/.ssh/authorized_keys ;" +
                "apt-get -qy update"
    end
  end

end
