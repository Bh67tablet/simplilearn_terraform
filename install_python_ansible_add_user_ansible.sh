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
sudo useradd -m ansiuser -s /bin/bash -p 'ansiuser'
sudo echo "ansiuser:ansiuser" | chpasswd
sudo cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo cp -p /etc/sudoers /etc/sudoers.bak
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i "s/^root.*$/root    ALL=(ALL:ALL) ALL\nansiuser ALL=NOPASSWD: ALL/g" /etc/sudoers
sudo systemctl restart sshd
