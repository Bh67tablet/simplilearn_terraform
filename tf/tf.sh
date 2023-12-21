#!/bin/bash
echo "Wähle das Terraform Modul!"
echo "1 - terraform-ec2-simple"
echo "2 - terraform-ec2-simple-variables"
read mod;
case $mod in
  1) modul=terraform-ec2-simple;;
  2) modul=terraform-ec2-simple-variables;;
  *) echo "This is not available. Please choose apply or destroy.";;
esac
echo "Terraform apply oder destroy?"
echo "1 - apply"
echo "2 - destroy"
read tf;
case $tf in
  1) command=apply;;
  2) command=destroy;;
  *) echo "This is not available. Please choose apply or destroy.";;
esac
terraform -chdir=${modul} init
terraform -chdir=${modul} $command --auto-approve
