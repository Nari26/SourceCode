########################################
# Script to install docker on centos7
########################################

#!/bin/bash

# remove older version of docker (if any)
sudo yum remove docker docker-common docker-selinux docker-engine-selinux docker-engine docker-ce

# Next install needed packages
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

#Configure the docker-ce repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#Finally install docker-ce
sudo yum install docker-ce

# start docker service 
sudo systemctl start docker.service

# enble docker service
sudo systemctl enable docker
