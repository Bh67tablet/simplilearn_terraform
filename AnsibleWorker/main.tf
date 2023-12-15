provider "aws" {
 	region 	= var.ec2_parameters.region
}

resource "aws_instance" "bh67" {
	count = 1
	ami 				= var.ec2_parameters.ami
	instance_type 			= var.ec2_parameters.itype
	subnet_id 			= var.subnet_id
	associate_public_ip_address 	= var.ec2_parameters.publicip
	key_name 			= var.ec2_parameters.keyname
	iam_instance_profile   		= var.ec2_parameters.iam_instance_profile
	tags = {
	    # The count.index allows you to launch a resource 
	    # starting with the distinct index number 0 and corresponding to this instance.
	    Name = "Kubernetes-${count.index}"
  	}
user_data = <<EOF
#! /bin/bash
echo "I was here">/var/tmp/greetings.txt
sudo apt -y update >>/var/tmp/yum.update 2>&1
sudo apt -y install git >>/var/tmp/yum.update 2>&1
sudo apt-get install -y software-properties-common >>/var/tmp/yum.update 2>&1
sudo apt-add-repository ppa:ansible/ansible >>/var/tmp/yum.update 2>&1
sudo apt-get update >>/var/tmp/yum.update 2>&1
sudo apt-get install -y ansible >>/var/tmp/yum.update 2>&1
sudo useradd -m ansiuser -s /bin/bash -p 'ansiuser' >>/var/tmp/yum.update 2>&1                                                                                                                                                    
sudo echo "ansiuser:ansiuser" | chpasswd >>/var/tmp/yum.update 2>&1
sudo cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.bak >>/var/tmp/yum.update 2>&1
sudo cp -p /etc/sudoers /etc/sudoers.bak >>/var/tmp/yum.update 2>&1
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config >>/var/tmp/yum.update 2>&1
sudo sed -i "s/^root.*$/root    ALL=(ALL:ALL) ALL\nansiuser ALL=NOPASSWD: ALL/g" /etc/sudoers >>/var/tmp/yum.update 2>&1
sudo systemctl restart sshd >>/var/tmp/yum.update 2>&1
sudo diff /etc/ssh/sshd_config /etc/ssh/sshd_config.bak >>/var/tmp/yum.update 2>&1
sudo diff /etc/sudoers /etc/sudoers.bak >>/var/tmp/yum.update 2>&1
sudo apt install -y awscli >>/var/tmp/yum.update 2>&1
sudo ansible-galaxy collection install amazon.aws -y >>/var/tmp/yum.update 2>&1
sudo apt install python3-pip -y >>/var/tmp/yum.update 2>&1
echo `hostname -I` > ip_`hostname`.txt
aws ec2 describe-instances --filters 'Name=tag:Name,Values=*' >> ip_`hostname`.txt
aws s3 cp ip_`hostname`.txt s3://bh67-githubactions-bucket/
sudo su - -c 'su - ansiuser -c "git clone https://github.com/Bh67tablet/simplilearn_aws4kubernetes.git"' >>/var/tmp/yum.update 2>&1
sudo chmod 755 /home/ansiuser/simplilearn_aws4kubernetes/AnsibleMaster/*.sh >>/var/tmp/yum.update 2>&1
# autoinstall
sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
## Install Docker
sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installDocker.sh -P /tmp
sudo chmod 755 /tmp/installDocker.sh
sudo bash /tmp/installDocker.sh
## Install kubeadm,kubelet,kubectl
sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installK8S-v1-23.sh -P /tmp
sudo chmod 755 /tmp/installK8S-v1-23.sh
sudo bash /tmp/installK8S-v1-23.sh
sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/kubernetes/0-install/daemon.json -P /etc/docker
sudo systemctl restart docker.service
EOF

  vpc_security_group_ids = [
    aws_security_group.bh67sg.id
  ]
  
  depends_on = [ aws_security_group.bh67sg ]
}
