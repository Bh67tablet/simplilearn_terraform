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
cp /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.bak
cat > /etc/ansible/ansible.cfg << EOF
[defaults]
inventory = /home/ansiuser/myinventory
EOF
diff /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.bak
cat /etc/ansible/ansible.cfg
#
wget https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_linux_amd64.zip
apt install unzip -y
unzip terraform_1.6.3_linux_amd64.zip
mv terraform /usr/bin
