resource "aws_security_group" "server_sg" {
  name        = "${var.project}-${var.environment}-server-sg"
  description = "Security group for server instances"
  vpc_id      = var.vpc_id

  tags = {
    Name    = "${var.project}-${var.environment}-server-sg"
    Project = var.project
    Env     = var.environment
  }
}

// Allow inbound traffic from your IP address
resource "aws_security_group_rule" "server_inbound_your_ip" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = aws_security_group.server_sg.id
  cidr_blocks       = var.user_cidr_blocks
}

resource "aws_security_group_rule" "server_outbound_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = aws_security_group.server_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}