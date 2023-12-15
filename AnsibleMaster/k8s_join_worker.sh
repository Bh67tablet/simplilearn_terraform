#!/bin/bash
sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/kubernetes/0-install/daemon.json -P /etc/docker
sudo systemctl restart docker.service
# sudo "join kommand from master"
