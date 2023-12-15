provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
}

resource "aws_instance" "myec2" {
  ami           = "ami-0bb4c991fa89d4b9b"
  instance_type = "t2.micro"

  tags = {
    Name = "Instance1"
  }
}
