resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "ec2_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.ec2_subnet_cidr_block
}

resource "aws_network_acl" "ec2_subnet_network_acl" {
  vpc_id = aws_vpc.vpc.id

  // All outward communications are permitted
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  // It can only be accessed from a limited number of IP addresses. For example, home IP, office IP, etc.
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.allowed_ip_cidr_block
    from_port  = 0
    to_port    = 65535
  }
}