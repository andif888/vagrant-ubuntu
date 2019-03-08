# Vagrant-Ubuntu

this repo spins up Ubuntu 16.04, installs Ansible, Docker and docker-compose.

## Requirements

You need a decent notebook or PC with a good amount of RAM (8 GB or more is recommended). 
It doesn't matter if it's Windows, MacOS or Linux. Ensure that VirtualBox and Vagrant is installed. 
To install VirtualBox please checkout https://www.virtualbox.org/wiki/Downloads 
To install Vargant please checkout https://www.vagrantup.com/downloads.html

## Using this repo

Clone the repo using 
```
git clone https://github.com/andif888/vagrant-ubuntu
```

after cloning the repo, change to the local directory using
```
cd vagrant-ubuntu
```

to spin up the VM run:
```
vagrant up
```

now be patient, it will take a while. 
Dependent on your internet connection speed it will take some time to download the Ubuntu base images for the first time.  
Sub sequent runs will start much faster.

to stop the test environment run
```
vagrant halt
```

to destroy and cleanup the test environment, run
```
vagrant destroy
```

## Logon credentials

The Ubuntu VM has default vagrant credentials:  
Username: vagrant  
Password: vagrant 