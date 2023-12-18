#!/bin/bash
terraform -chdir=AnsibleS3 init 
terraform -chdir=AnsibleS3 apply --auto-approve
terraform -chdir=AnsibleIam init 
terraform -chdir=AnsibleIam apply --auto-approve
terraform -chdir=AnsibleWorker init 
terraform -chdir=AnsibleWorker apply --auto-approve
terraform -chdir=AnsibleMaster init
terraform -chdir=AnsibleMaster apply --auto-approve
