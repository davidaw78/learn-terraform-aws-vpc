terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "default_vpc" {
 cidr_block = "10.0.0.0/16"
 
 tags = {
   Name = "learn-terraform-vpc"
 }
}

resource "aws_subnet" "public_subnets" {
 vpc_id     = aws_vpc.default_vpc.id
 cidr_block = "10.0.1.0/24"
 availability_zone = "us-east-1a"
 tags = {
   Name = "terraform-public-subnet-A"
 }
}
 
resource "aws_subnet" "private_subnets" {
 vpc_id     = aws_vpc.default_vpc.id
 cidr_block = "10.0.2.0/24"
 availability_zone = "us-east-1a"
 tags = {
   Name = "terrform-private-subnet-B"
 }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.default_vpc.id
  route = []  
  tags = {
    Name = "terraform-private-route-table"
  }
}
