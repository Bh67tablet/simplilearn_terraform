terraform {
  backend "s3" {
    bucket = "bh67-githubactions-bucket"
    key    = "AnsibleIAM/terraform.tfstate"
    region = "us-east-1"
  }
}
