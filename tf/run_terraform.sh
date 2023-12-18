#!/bin/bash
terraform -chdir=AnsibleS3 init 
terraform -chdir=AnsibleS3 destroy --auto-approve
terraform -chdir=AnsibleIam init 
terraform -chdir=AnsibleIam destroy --auto-approve
terraform -chdir=AnsibleWorker init 
terraform -chdir=AnsibleWorker destroy --auto-approve
terraform -chdir=AnsibleMaster init
terraform -chdir=AnsibleMaster destroy --auto-approve
