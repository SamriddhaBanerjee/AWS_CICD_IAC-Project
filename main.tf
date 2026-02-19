provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "myCiCdAWS" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Git_IAC_Create"
  }
}
terraform {
  backend "s3" {
    bucket         = "sammy-demo-bucket-1234567"
    key            = "sam_dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "sammy-terraform-lock-table"
    encrypt        = true
  }
  backend "s3" {
    bucket         = "sammy-demo-bucket-1234567"
    key            = "sam_acc/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "sammy-terraform-lock-table"
    encrypt        = true
  }
}
