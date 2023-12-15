#!/bin/bash
sudo useradd -m ansiuser -s /bin/bash -p 'ansiuser'
sudo echo "ansiuser:ansiuser" | chpasswd
sudo cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo cp -p /etc/sudoers /etc/sudoers.bak
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i "s/^root.*$/root    ALL=(ALL:ALL) ALL\nansiuser ALL=NOPASSWD: ALL/g" /etc/sudoers
sudo systemctl restart sshd
cp /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.bak
cat > /etc/ansible/ansible.cfg << EOF
[defaults]
inventory = /home/ansiuser/myinventory
EOF
diff /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.bak
cat /etc/ansible/ansible.cfg
#
