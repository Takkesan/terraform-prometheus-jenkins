variable "vpc_cidr_block" {
  description = "VPC of CIDR block"
  type        = string
}

variable "ec2_subnet_cidr_block" {
  description = "CIDR block for the subnet where EC2 instances will be placed"
  type        = string
  default     = "10.0.0.0/24"
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}