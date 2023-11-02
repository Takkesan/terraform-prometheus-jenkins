resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "ec2_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.ec2_subnet_cidr_block
}