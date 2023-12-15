#!/bin/bash
sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/kubernetes/0-install/daemon.json -P /etc/docker
sudo systemctl restart docker.service
sudo kubeadm init
mkdir -p $HOME/.kube 
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/calico.yaml
kubectl get nodes -o wide
