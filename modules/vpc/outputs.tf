output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "server_subnet_id" {
  value = aws_subnet.ec2_subnet.id
}
