variable "server_subnet_id" {
  description = "Server of CIDR block"
  type        = string
}

variable "server_security_group_id" {
  description = "Server security group id"
  type        = string
}

variable "user_data" {
  description = "User data"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "Key name"
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