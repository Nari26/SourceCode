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
echo 'Vagrant.configure("2") do |config|
  config.vm.box = "zyz/centos7"                           # Centos7 image to be used, you can use ubuntu,redhat linux based on your use case.
  config.vm.network "private_network", type: "dhcp"       # Configure network to get a random ip address
end' > vagrantfile

# bring up the virutal box 
vagrant up

# ssh into the virtual box to get the ip address
vagrant ssh
