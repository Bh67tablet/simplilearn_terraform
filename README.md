# Automating Infrastructure using Terraform, Ansible, Jenkins
Course-end Project 1
Description

Project Agenda:

Use Terraform to provision infrastructure

Description: 


Nowadays, infrastructure automation is critical. We tend to put the most emphasis on software development processes, but infrastructure deployment strategy is just as important. Infrastructure automation not only aids disaster recovery, but it also facilitates testing and development.

Your organization is adopting the DevOps methodology and in order to automate provisioning of infrastructure there's a need to setup a centralised server for Jenkins.
Terraform is a tool that allows you to provision various infrastructure components. Ansible is a platform for managing configurations and deploying applications. It means you'll use Terraform to build a virtual machine, for example, and then use Ansible to instal the necessary applications on that machine.
Considering the Organizational requirement you are asked to automate the infrastructure using Terraform first and install other required automation tools in it.


Tools required:

Terraform, AWS account with security credentials, Keypair

Expected Deliverables: 
Launch an EC2 instance using Terraform
Connect to the instance
Install Jenkins, Java and Python in the instance.

# setup
## terraform
1. launch terraform ec2
2. create aws user with cli admin access policy
3. aws configure
4. git clone this repo

## install python, java, Ansible, Jenkins
cd in this repo
run_terraform.sh

### setup jenkins
1. ssh tunnel with public IPv4: (e.g.: ssh -i "simplilearn_key.pem" ubuntu@ec2-18-212-50-222.compute-1.amazonaws.com -L 8081:18.212.50.222:8080)
2. sudo cat /var/lib/jenkins/secrets/initialAdminPassword
3. localhost:8081
4. edit Jenkins/dev.ini (add actual Ansible Worker private IPv4)
5. add Ansible plugin
6. Manage Jenkins--> Configure Tools --> Scroll down to find Ansible --> Add ansible--> give name as myansible-->give path as /usr/bin
7. add pipeline, with git repo, this repository, change master to main, Jenkins/jenkinsfile, user: ansiuser
#### ssh tunnel jenkins (local git bash)
ssh -i "simplilearn_key.pem" ubuntu@ec2-18-212-50-222.compute-1.amazonaws.com -L 8081:18.212.50.222:8080

#### create jenkins job with cli
java -jar jenkins-cli.jar -auth admin:113daeb9e795aebf844540dd96fc120ac6 -s http://localhost:8080 create-job pipeline3 < pipeline1.xml

![1](tf/Jenkins/api_token.png)
