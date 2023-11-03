resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public_ec2_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.ec2_subnet_cidr_block
  map_public_ip_on_launch = true
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  
  tags = {
    Type = "public"
  }
}

resource "aws_route_table_association" "public_rt_ec2" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_ec2_subnet.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route" "public_rt_ec2" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}