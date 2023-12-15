#!/bin/bash
whoami
apt -y update
apt -y install git
apt-get install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt -y update
apt-get install -y ansible
apt install -y awscli
ansible-galaxy collection install amazon.aws -y
apt install python3-pip -y
#