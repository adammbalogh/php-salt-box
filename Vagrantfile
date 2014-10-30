# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "salt/roots/", "/srv/"
  config.vm.synced_folder "application/", "/var/www/application/"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
  end

  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.colorize = true
    salt.verbose = true
    salt.log_level = "error"
    salt.run_highstate = true
  end
end
