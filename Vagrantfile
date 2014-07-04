# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "salt/roots/", "/srv/"
  config.vm.synced_folder "www/", "/var/www/"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
  end

  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.colorize = true
    salt.run_highstate = true
  end
end
