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

    config.vm.define "ubnt" do |ubnt|
        ubnt.vm.box = "ubuntu/xenial64"  
        ubnt.vm.network :forwarded_port, guest: 4321, host: 4321, id: "phantasy"  

        ubnt.vm.provision "run_prepare", type: "shell", path: "./scripts/prepare.sh"
        ubnt.vm.provision "run_ansible_playbook", type: "shell", inline: <<-SHELL
            cd /vagrant/ansible
            ansible-playbook -i inventory -b playbook.yml
        SHELL
    end
end
