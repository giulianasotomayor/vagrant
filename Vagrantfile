# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    
    config.vm.define "wordpress" do |wordpress|
      wordpress.vm.box = "ubuntu/focal64"
      wordpress.vm.box_check_update = false
      wordpress.vm.hostname = "wordpress"
      config.vm.network "public_network", ip: "192.168.1.30", bridge: "wlp2s0"
      wordpress.vm.network "private_network", ip: "172.192.0.2", nic_type: "virtio", virtualbox__intnet: "keepcoding"
      wordpress.vm.network "forwarded_port", guest: 80, host: 88
      wordpress.vm.provider "virtualbox" do |vb|
        vb.name = "wordpress"
        vb.memory = "1024"
        vb.default_nic_type = "virtio"
        file_to_disk = "extradisk1.vmdk"
      unless File.exist?(file_to_disk)
          vb.customize [ "createmedium", "disk", "--filename", "extradisk1.vmdk", "--format", "vmdk", "--size", 1024 * 1 ]
      end
        vb.customize [ "storageattach", "wordpress" , "--storagectl", "SCSI", "--port", "2", "--device", "0", "--type", "hdd", "--medium", file_to_disk]
      
      wordpress.vm.provision "shell", path: "provision_wp.sh"
      wordpress.vm.provision "shell", path: "config_db.sh"
      wordpress.vm.provision "shell", path: "config_php.sh"
      wordpress.vm.provision "shell", path: "install_wp.sh"
      wordpress.vm.provision "shell", path: "install_filebeat.sh"
      
      end
    end
    
    config.vm.define "elasticsearch" do |elasticsearch|
      elasticsearch.vm.box = "ubuntu/focal64"
      elasticsearch.vm.box_check_update = false
      elasticsearch.vm.hostname = "elasticsearch"
      elasticsearch.vm.network "public_network", ip: "192.168.1.31", bridge: "wlp2s0"
      elasticsearch.vm.network "private_network", ip: "172.192.0.3", nic_type: "virtio", virtualbox__intnet: "keepcoding"
      elasticsearch.vm.network "forwarded_port", guest: 9200, host: 9292
      elasticsearch.vm.network "forwarded_port", guest: 80, host: 89
      elasticsearch.vm.provider "virtualbox" do |vb|
        vb.name = "elasticsearch"
        vb.memory = "5120"
        vb.default_nic_type = "virtio"
      end

      elasticsearch.vm.provision "shell", path: "provision_elk.sh"
      elasticsearch.vm.provision "shell", path: "install_elk.sh"

    end 
    
  end
