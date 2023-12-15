#!/bin/bash
sudo useradd -m ansiuser -s /bin/bash -p 'ansiuser'
sudo echo "ansiuser:ansiuser" | chpasswd
sudo cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo cp -p /etc/sudoers /etc/sudoers.bak
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i "s/^root.*$/root    ALL=(ALL:ALL) ALL\nansiuser ALL=NOPASSWD: ALL/g" /etc/sudoers
sudo systemctl restart sshd
cp /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.bak
#
# add IPv4 adresses to /home/ansiuser/ips
#
cat > /etc/ansible/ansible.cfg << EOF
[defaults]
inventory = /home/ansiuser/myinventory
EOF
diff /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.bak
cat /etc/ansible/ansible.cfg
#
echo [webserver] > /home/ansiuser/myinventory
for ip in $(cat /home/ansiuser/ips); do echo $ip >> /home/ansiuser/myinventory; done
#
mkdir /home/ansiuser/.ssh
chmod 700 /home/ansiuser/.ssh
for ip in $(cat /home/ansiuser/ips); do sshpass -pansiuser ssh -o StrictHostKeyChecking=no ansiuser@$ip rm -rf .ssh; done
ssh-keygen -q -t rsa -f /home/ansiuser/.ssh/id_rsa -N '' <<< $'\ny' >/dev/null 2>&1
for ip in $(cat /home/ansiuser/ips); do sshpass -pansiuser ssh-copy-id -i /home/ansiuser/.ssh/id_rsa.pub ansiuser@$ip; done
for ip in $(cat /home/ansiuser/ips); do ssh -o StrictHostKeyChecking=no ansiuser@$ip ls -la; done
for ip in $(cat /home/ansiuser/ips); do ssh -o StrictHostKeyChecking=no ansiuser@$ip ls -la .ssh; done
for ip in $(cat /home/ansiuser/ips); do ssh -o StrictHostKeyChecking=no ansiuser@$ip uname -a; done