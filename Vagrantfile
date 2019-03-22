# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.2"

Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v, override|
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 2]
        v.customize ["modifyvm", :id, "--vram", 128]
        v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        v.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]
    end

    config.vm.define "winsrv" do |winsrv|
        winsrv.vm.box = "gusztavvargadr/windows-server"
        winsrv.vm.communicator = "winrm"
  
        # Admin user name and password
        winsrv.winrm.username = "vagrant"
        winsrv.winrm.password = "vagrant"
  
        winsrv.vm.guest = :windows
        winsrv.windows.halt_timeout = 15
  
        winsrv.vm.network "private_network", virtualbox__intnet: true, ip: "192.168.123.2"
  
        winsrv.vm.provision "shell",
          name: "enable-winrm-for-ansible",
          path: "scripts/enable-winrm-for-ansible.ps1"  
    end

    config.vm.define "ubnt" do |ubnt|
        ubnt.vm.box = "ubuntu/xenial64"  
        ubnt.vm.network :forwarded_port, guest: 4321, host: 4321, id: "phantasy"
        ubnt.vm.network "private_network", virtualbox__intnet: true, ip: "192.168.123.5"  

        ubnt.vm.provision "run_prepare", type: "shell", path: "./scripts/prepare.sh"
        ubnt.vm.provision "run_ansible_playbook", type: "shell", inline: <<-SHELL
            cd /vagrant/ansible
            ansible-playbook -i inventory -b playbook.yml
            rsync -a /vagrant/wordpress /home/vagrant
            rsync -a /vagrant/terraform_azure /home/vagrant 
        SHELL
    end
end
