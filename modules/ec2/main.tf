// The latest Amazon Linux AMI
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.server_key_pair_name
  public_key = file("~/keys/id_rsa.pub")
}


resource "aws_instance" "server" {
    ami           = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"
  
  subnet_id = var.server_cidr_block
  key_name = aws_key_pair.key_pair.key_name
}