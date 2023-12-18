provider "aws" {
 	region 	= var.ec2_parameters.region
}

resource "aws_instance" "AnsibleMaster" {
	count = 1
	ami 				= var.ec2_parameters.ami
	instance_type 			= var.ec2_parameters.itype
	associate_public_ip_address 	= var.ec2_parameters.publicip
	key_name 			= var.ec2_parameters.keyname
	iam_instance_profile   		= var.ec2_parameters.iam_instance_profile
	vpc_security_group_ids 		= [data.terraform_remote_state.AnsibleWorker.outputs.bh67_sec_group]
	tags = {
	    # The count.index allows you to launch a resource 
	    # starting with the distinct index number 0 and corresponding to this instance.
	    Name = "AnsibleMaster-${count.index}"
  	}
user_data = <<EOF
#! /bin/bash
sudo useradd -m ansiuser -s /bin/bash -p 'ansiuser'
sudo echo "ansiuser:ansiuser" | chpasswd
sudo cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo cp -p /etc/sudoers /etc/sudoers.bak
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i "s/^root.*$/root    ALL=(ALL:ALL) ALL\nansiuser ALL=NOPASSWD: ALL/g" /etc/sudoers
sudo systemctl restart sshd
sudo su - -c 'su - ansiuser -c "git clone https://github.com/Bh67tablet/simplilearn_terraform.git"' >>/var/tmp/yum.update 2>&1
sudo chmod 755 /home/ansiuser/simplilearn_terraform/tf/AnsibleMaster/*.sh >>/var/tmp/yum.update 2>&1
sudo sh /home/ansiuser/simplilearn_terraform/tf/AnsibleMaster/master_config_run_as_root.sh >>/var/tmp/yum.update 2>&1
sudo su - -c 'su - ansiuser -c /home/ansiuser/simplilearn_terraform/tf/AnsibleMaster/master_config_run_as_ansiuser.sh' >>/var/tmp/ansiuser.log 2>&1
# autoinstall
sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
sudo bash /home/ansiuser/simplilearn_terraform/tf/AnsibleMaster/install_jenkins.sh >>/var/tmp/yum.update 2>&1
EOF
}
