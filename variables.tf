variable "region" {
  description = "Specifies the AWS region."
  type        = string
  default     = "us-east-1"
}

variable "main-cidr-block" {
  description = "Specifies the main CIDR block."
  type        = string
  default     = "10.0.0.0/27"
}

variable "project-tag" {
  description = "Specifies the name tag."
  type        = string
  default     = "learn-tf-aws-vpc"
}
