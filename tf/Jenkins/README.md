# jenkins-cli
## configure Ansible Plugin
Jenkins verwalten >
Tools: >
Ansible: 
myansible
/usr/bin

## create-job
java -jar jenkins-cli.jar -auth admin:113daeb9e795aebf844540dd96fc120ac6 -s http://localhost:8080 create-job pipeline3 < pipeline1.xml

### test
java -jar jenkins-cli.jar -auth admin:admin -s http://localhost:8080 create-job pipeline1 < pipeline1.xml

https://www.jenkins.io/doc/book/managing/cli/#ssh
http://localhost:8080/jnlpJars/jenkins-cli.jar
