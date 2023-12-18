data "terraform_remote_state" "AnsibleWorker" {
  backend = "s3"
  config = {
    bucket = "bh67-githubactions-bucket"
    key	   = "AnsibleWorker/terraform.tfstate"
    region = "us-east-1"
  }
}

terraform {
  backend "s3" {
    bucket = "bh67-githubactions-bucket"
    key    = "AnsibleMaster/terraform.tfstate"
    region = "us-east-1"
  }
}
