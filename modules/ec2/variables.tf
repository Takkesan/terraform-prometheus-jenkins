variable "server_cidr_block" {
  description = "Server of CIDR block"
  type        = string
}

variable "server_key_pair_name" {
    description = "Server of key pair name"
    type        = string
    default = "prometheus-jenkins-key-pair"
}