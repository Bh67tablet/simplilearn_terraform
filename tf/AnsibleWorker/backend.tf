terraform {
  backend "s3" {
    bucket = "bh67-githubactions-bucket"
    key    = "AnsibleWorker/terraform.tfstate"
    region = "us-east-1"
  }
}
