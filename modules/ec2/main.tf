// The latest Amazon Linux AMI
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}


resource "aws_instance" "server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  subnet_id = var.server_subnet_id
  key_name  = var.key_name
  vpc_security_group_ids = [
    var.server_security_group_id,
  ]

  user_data = var.user_data != "" ? var.user_data : null

  tags = {
    Name    = "${var.project}-${var.environment}-server"
    Project = var.project
    Env     = var.environment
    Type    = "app"
  }
}