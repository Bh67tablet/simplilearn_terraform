#!/bin/bash
sudo kubeadm init
mkdir -p $HOME/.kube 
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/calico.yaml
sudo kubeadm token create --print-join-command > kube_token.txt
aws s3 cp kube_token.txt s3://bh67-githubactions-bucket/
echo "now run sudo $(cat kube_token.txt) on worker nodes"
for ip in $(cat /home/ansiuser/ips); do ssh -o StrictHostKeyChecking=no ansiuser@$ip sudo $(cat kube_token.txt); done
