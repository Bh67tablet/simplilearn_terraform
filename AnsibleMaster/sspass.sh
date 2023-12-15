#!/bin/bash
for ip in $(cat /home/ansiuser/ips); do sshpass -pansiuser ssh -o StrictHostKeyChecking=no ansiuser@$ip rm -rf .ssh; done
ssh-keygen -q -t rsa -f /home/ansiuser/.ssh/id_rsa -N '' <<< $'\ny' >/dev/null 2>&1
for ip in $(cat /home/ansiuser/ips); do sshpass -pansiuser ssh-copy-id -i .ssh/id_rsa.pub ansiuser@$ip; done
for ip in $(cat /home/ansiuser/ips); do ssh -o StrictHostKeyChecking=no ansiuser@$ip ls -la; done
for ip in $(cat /home/ansiuser/ips); do ssh -o StrictHostKeyChecking=no ansiuser@$ip ls -la .ssh; done
for ip in $(cat /home/ansiuser/ips); do ssh -o StrictHostKeyChecking=no ansiuser@$ip uname -a; done
