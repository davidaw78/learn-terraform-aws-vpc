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
  cidr_block           = "10.2.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "learn-terraform-vpc"
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id            = aws_vpc.default_vpc.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "terraform-public-subnet-A"
  }
}

resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.default_vpc.id
  cidr_block        = "10.2.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "terrform-private-subnet-B"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.default_vpc.id
  route = {
    cidr_block = "10.2.1.0/24"
    subnet_id  = aws_subnet.public_subnets.id
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "terraform-public-route-table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.default_vpc.id
  route = []
  tags = {
    Name = "terraform-private-route-table"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default_vpc.id

  tags = {
    Name = "terraform-igw"
  }
}

