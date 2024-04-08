provider "aws" {
  region = var.region
}

resource "aws_vpc" "learn-tf-aws-vpc" {
  cidr_block = var.main-cidr-block
  tags = {
    Name = var.project-tag
  }
}