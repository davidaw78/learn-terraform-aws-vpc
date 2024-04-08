# Define AWS as the provider with the specified region.
provider "aws" {
  region = var.region  # Use the region specified in the variable "region".
}

# Create an AWS VPC with the specified CIDR block and tags.
resource "aws_vpc" "demo-main-vpc" {
  cidr_block = var.main-cidr-block  # Set the CIDR block for the VPC.
  tags = {
    Name = var.project-tag  # Assign the project tag to the VPC.
  }
}

resource "aws_subnet" "public-subnet-01" {
    vpc_id = aws_vpc.demo-main-vpc.id
    cidr_block = var.public-subnet-cidrs
}