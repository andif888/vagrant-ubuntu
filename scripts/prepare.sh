#!/bin/bash -uex

export DEBIAN_FRONTEND=noninteractive
export LC_ALL=C

sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
software-properties-common unzip git python-dev python-pip python-wheel python-setuptools \
openssh-client libssl-dev libkrb5-dev krb5-user

# sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends krb5-user

sudo pip install --upgrade pip
sudo pip install ansible cryptography pywinrm kerberos requests_kerberos