#!/bin/bash
sudo wget https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_linux_amd64.zip
sudo apt install unzip -y
sudo yum install unzip -y
sudo unzip terraform_1.6.3_linux_amd64.zip
sudo mv terraform /usr/bin
