output "jenkins_sg_id" {
  value = aws_security_group.jenkins_sg.id
}

output "promtheus_sg_id" {
  value = aws_security_group.prometheus_sg.id
}