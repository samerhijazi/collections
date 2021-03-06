# -*- mode: ruby -*-
# vi: set ft=ruby :
IMAGE_NAME = "ubuntu/focal64"

Vagrant.configure("2") do |config|
    config.vm.synced_folder ".", "/vagrant"
	
	config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.cpus = 2
        vb.memory = 4096
    end      
    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.hostname = "k8s-master"
        master.vm.network "public_network", bridge: "br0", mac: "0800272657FA", ip: "192.168.178.80"
    end    
    config.vm.define "k8s-worker01" do |worker01|
        worker01.vm.box = IMAGE_NAME
        worker01.vm.hostname = "k8s-worker01"            
        worker01.vm.network "public_network", bridge: "br0",  mac: "0800272657FB", ip: "192.168.178.81"
    end    	
end