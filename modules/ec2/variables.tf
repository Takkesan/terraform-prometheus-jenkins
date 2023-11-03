variable "server_subnet_id" {
  description = "Server of CIDR block"
  type        = string
}

variable "public_key_path" {
  description = "Path to public key"
  type        = string
}

variable "key_name" {
  description = "Name of key"
  type        = string
  default     = "mykey"
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}