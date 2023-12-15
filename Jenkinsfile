pipeline{
    
    agent any
    stages{
      stage('Clone the repo with playbook')  
      {
          steps{
              git branch: 'main', url: 'https://github.com/Bh67tablet/simplylearn_Jenkins_Ansible.git'
          }
      }
      stage('install maven & Docker')
      {
          steps{
              ansiblePlaybook credentialsId: 'ansiuser', disableHostKeyChecking: true, installation: 'myansible', inventory: 'dev.inv', playbook: 'PlaybookInstall.yml'
          }
      }
    }
}
