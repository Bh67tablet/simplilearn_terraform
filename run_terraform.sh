#!/bin/bash
cd $HOME/simplilearn_terraform/AnsibleS3
terraform init
terraform apply --auto-approve
cd $HOME/simplilearn_terraform/AnsibleIam
terraform init
terraform apply --auto-approve
cd $HOME/simplilearn_terraform/AnsibleWorker
terraform init
terraform apply --auto-approve
sleep 60
cd $HOME/simplilearn_terraform/AnsibleMaster
terraform init
terraform apply --auto-approve
