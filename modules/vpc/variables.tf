variable "vpc_cidr_block" {
  description = "VPC of CIDR block"
  type        = string
}

variable "ec2_subnet_cidr_block" {
  description = "CIDR block for the subnet where EC2 instances will be placed"
  type        = string
}

variable "allowed_ip_cidr_block" {
  description = "CIDR block for allowed IP such as your home IP, office IP etc."
  type        = string
}