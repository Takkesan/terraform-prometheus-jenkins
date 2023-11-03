variable "server_subnet_id" {
  description = "Server of CIDR block"
  type        = string
}

variable "server_security_group_id" {
  description = "Server security group id"
  type        = string
}

variable "public_key_path" {
  description = "Path to public key"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}