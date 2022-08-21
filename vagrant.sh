#############################################################################################
#  
# Script to create Centos7 server on Oracle VirtualBox using vagrant                                    
# 
# pre-reqs: Oracle VM box, Vagrant to be installed on windows prior to this script execution
#
#############################################################################################

#!/bin/bash

# create a directory
mkdir -p zyz-centos
cd zyz-centos

# Initialize vagrant
vagrant init

# Update vagrantfile with required configuration - image,network 
echo '$script = <<-SCRIPT
echo "==========================Installing Java=========================="
sudo yum install -y java-11-openjdk
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo --no-check-certificate
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
echo "======================= Installing Jenkins ========================="
sudo yum install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sudo hostname -I
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", type: "dhcp", ip: "192.168.1.1"
  config.vm.provision "shell", inline: $script
end' > vagrantfile

# bring up the virutal box 
vagrant up

# ssh into the virtual box to get the ip address
vagrant ssh
