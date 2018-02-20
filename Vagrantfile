# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'json'

# load configuration data
configuration = JSON.parse(File.read('files/data/config.json'))

Vagrant.configure("2") do |config|
  config.vm.define "masternode" do |vbox|
    # general config
    vbox.vm.box = "xcoo/xenial64"
    vbox.vm.hostname = "masternode.vm"
    # virtualbox config
    vbox.vm.provider "virtualbox" do |v|
      v.memory = 8192
      v.cpus = 4
    end
    # AWS config
    vbox.vm.provider :aws do |aws, override|
      aws.access_key_id = configuration['aws_credentials']['access_key_id']
      aws.secret_access_key = configuration['aws_credentials']['secret_access_key']
      aws.keypair_name = configuration['aws_credentials']['keypair_name']
      aws.instance_type = "t2.medium"
      aws.region = "us-east-1"
      aws.region_config "us-east-1", :ami => "ami-b3425cc9"
      override.ssh.username = "ubuntu"
      override.ssh.private_key_path = configuration['aws_credentials']['keypath']
    end
    vbox.vm.provision :shell, inline: "chmod +x /vagrant/files/scripts/*.sh"
    vbox.vm.provision :shell, inline: "RPC_PASSWORD=#{configuration['rpc_password']}/vagrant/files/scripts/install.sh"
  end
end
