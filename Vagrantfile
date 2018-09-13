# frozen_string_literal: true

# -*- mode: ruby -*-
# vi: set ft=ruby :

Dotenv.load if defined?(Dotenv)

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "dummy"
  config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

  config.vm.provider :aws do |aws, override|
    aws.access_key_id = ENV["AWS_ACCESS_KEY_ID"]
    aws.secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
    aws.keypair_name = ENV["KEYPAIR_NAME"]

    aws.region = "ap-northeast-1"
    aws.availability_zone = "ap-northeast-1a"
    aws.subnet_id = "subnet-2b5d4e62"
    aws.security_groups = [
      "sg-95ed08ee", # ssh group
    ]
    aws.associate_public_ip = true
    aws.ssh_host_attribute = :public_ip_address

    # Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type
    aws.ami = "ami-9c9443e3"

    aws.instance_type = "t2.micro"

    aws.tags = {
      "Name" => "#{`whoami`.strip}-vagrant"
    }
    aws.user_data = <<~BASH
      #!/bin/sh
      sed -i 's/^.*requiretty/#Defaults requiretty/' /etc/sudoers
    BASH

    override.ssh.username = "ec2-user"
    override.ssh.private_key_path = ENV["PRIVATE_KEY_PATH"]
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder ".", "/vagrant", disabled: false, type: 'rsync'

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  args = ENV["DRY_RUN"] ? "--dry-run" : ""

  config.vm.provision :shell, inline: <<~BASH
    cd /vagrant
    ./bin/mitamae-x86_64-linux local bootstrap.rb --node-yaml=node.yml #{args}
  BASH

  config.vm.provision :serverspec do |spec|
    # pattern for specfiles to search
    spec.pattern = "spec/**/*_spec.rb"
  end
end
