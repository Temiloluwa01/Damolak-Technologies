terraform {
  backend "s3" {
    bucket = "temi-terraform-state"
    key    = "dev/ec2.tfstate"
    region = "eu-west-1"
  }
}