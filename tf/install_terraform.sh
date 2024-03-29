#!/bin/bash

install_ubuntu() {
	sudo apt -y update
	sudo apt -y install unzip
	sudo apt -y install git
 	sudo terraform_latest=$( curl -s https://releases.hashicorp.com/terraform/ | sed "s|.*\">||g" | egrep "^terraform_[0-9]+\.[0-9]+\.[0-9]+</a>$" | sed "s|</a>||g;s|^terraform_||g" | head -1 ) && wget https://releases.hashicorp.com/terraform/${terraform_latest}/terraform_${terraform_latest}_linux_amd64.zip
	sudo unzip terraform_${terraform_latest}_linux_amd64.zip
	sudo mv terraform /usr/bin
	exit 0
}

install_centos() {
	sudo yum -y update
	sudo yum -y install unzip
	sudo yum -y install git
 	sudo terraform_latest=$( curl -s https://releases.hashicorp.com/terraform/ | sed "s|.*\">||g" | egrep "^terraform_[0-9]+\.[0-9]+\.[0-9]+</a>$" | sed "s|</a>||g;s|^terraform_||g" | head -1 ) && wget https://releases.hashicorp.com/terraform/${terraform_latest}/terraform_${terraform_latest}_linux_amd64.zip
	sudo unzip terraform_${terraform_latest}_linux_amd64.zip
	sudo mv terraform /usr/bin
	exit 0
}
################ MAIN ###################

if [ -f /etc/os-release ];then
   osname=`grep ID /etc/os-release | egrep -v 'VERSION|LIKE|VARIANT|PLATFORM' | cut -d'=' -f2 | sed -e 's/"//' -e 's/"//'`
   echo $osname
   if [ $osname == "ubuntu" ];then
       install_ubuntu
   elif [ $osname == "amzn" ];then
       install_centos
   elif [ $osname == "centos" ];then
       install_centos
  fi
else
   echo "can not locate /etc/os-release - unable find the osname"
   exit 8
fi
exit 0
