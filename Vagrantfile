# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "vm-ansible"
  config.vm.synced_folder "./mikrotik-provision", "/home/vagrant/mikrotik-provision",
    owner: "vagrant", group: "vagrant"
  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "32"]
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.name = "vagrant-ansible"
  end

  $script = <<-SCRIPT
  export DEBIAN_FRONTEND=noninteractive
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get -y install software-properties-common
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get -y install ansible mc tree
  SCRIPT

  config.vm.provision "shell", inline: $script
end
