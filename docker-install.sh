#!/bin/sh

# Remove older versions.
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# Install required packages
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
  
# SET UP THE REPOSITORY
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install docker
sudo yum install -y docker-ce  docker-ce-cli containerd.io

# Start Docker
sudo systemctl start docker

# Enable on boot
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER

  
