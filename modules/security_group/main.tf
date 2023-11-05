// Jenkins SG
resource "aws_security_group" "jenkins_sg" {
  name        = "${var.project}-${var.environment}-jenkins-sg"
  description = "Security group for server instances"
  vpc_id      = var.vpc_id

  tags = {
    Name    = "${var.project}-${var.environment}-jenkins-sg"
    Project = var.project
    Env     = var.environment
  }
}

resource "aws_security_group_rule" "jenkins_outbound" {

  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]


  security_group_id = aws_security_group.jenkins_sg.id
  type              = "egress"
}


resource "aws_security_group_rule" "jenkins_port_inbound_your_ip" {

  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = var.user_cidr_blocks

  security_group_id = aws_security_group.jenkins_sg.id
  type              = "ingress"
}

resource "aws_security_group_rule" "ssh_port_jenkins_inbound_your_ip" {

  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.user_cidr_blocks

  security_group_id = aws_security_group.jenkins_sg.id
  type              = "ingress"
}


// Prometheus SG
resource "aws_security_group" "prometheus_sg" {
  name        = "${var.project}-${var.environment}-prometheus-sg"
  description = "Security group for server instances"
  vpc_id      = var.vpc_id

  tags = {
    Name    = "${var.project}-${var.environment}-prometheus-sg"
    Project = var.project
    Env     = var.environment
  }
}

resource "aws_security_group_rule" "prometheus_outbound" {

  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]


  security_group_id = aws_security_group.prometheus_sg.id
  type              = "egress"
}

resource "aws_security_group_rule" "promehteus_port_inbound_your_ip" {
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  cidr_blocks       = var.user_cidr_blocks
  type              = "ingress"
  security_group_id = aws_security_group.prometheus_sg.id
}

resource "aws_security_group_rule" "ssh_port_prometheus_inbound_your_ip" {

  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.user_cidr_blocks

  security_group_id = aws_security_group.prometheus_sg.id
  type              = "ingress"
}


// Node Exporter
resource "aws_security_group_rule" "node_exporter_port_inbound" {
  type        = "ingress"
  from_port   = 9100
  to_port     = 9100
  protocol    = "tcp"
  security_group_id = aws_security_group.jenkins_sg.id

  cidr_blocks = ["0.0.0.0/0"]
}