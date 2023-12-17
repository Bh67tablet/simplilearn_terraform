# jenkins-cli
## create-job
java -jar jenkins-cli.jar -auth admin:113daeb9e795aebf844540dd96fc120ac6 -s http://localhost:8080 create-job pipeline3 < pipeline1.xml

### test
java -jar jenkins-cli.jar -auth admin:admin -s http://localhost:8080 create-job pipeline3 < pipeline1.xml
