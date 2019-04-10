$script = <<-SCRIPT
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible mc tree
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "vm-vagrant-ansible"
  config.vm.provision "shell", inline: $script
  config.vm.synced_folder "./mikrotik-provision", "/home/vagrant/mikrotik-provision", create: true
end
