#!/bin/bash
#
# add actual Ansible Worker IPv4 adresses:
#
cat > /home/ansiuser/ips << EOF
172.31.33.219
172.31.37.180
EOF
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
