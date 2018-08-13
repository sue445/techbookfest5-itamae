#!/bin/bash -xe

# Install git-archive-all
sudo apt-get update
sudo apt-get install -y python-pip
sudo pip install git-archive-all

# Install packer
wget "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip" -O /tmp/packer.zip
sudo unzip -o -d /usr/local/bin /tmp/packer.zip
sudo chmod +x /usr/local/bin/packer

wget "https://github.com/sue445/packer-provisioner-serverspec/releases/download/v${PACKER_PROVISIONER_SERVERSPEC_VERSION}/packer-provisioner-serverspec_linux_amd64" -O /tmp/packer-provisioner-serverspec
sudo mv /tmp/packer-provisioner-serverspec /usr/local/bin
sudo chmod +x /usr/local/bin/packer-provisioner-serverspec
