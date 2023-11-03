variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "user_cidr_blocks" {
  description = "Security group allows this CIDR blocks, please use your home IP, office IP and etc."
  type        = list(string)
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}