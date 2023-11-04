module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr_block = "10.0.0.0/16"

  project     = var.project
  environment = var.environment
}

module "security_group" {
  source = "../../modules/security_group"

  user_cidr_blocks = ["YOUR IP/32"]
  vpc_id           = module.vpc.vpc_id

  project     = var.project
  environment = var.environment
}

resource "aws_key_pair" "key_pair" {
  key_name   = "${var.project}-${var.environment}-key-pair"
  public_key = file("../../keys/prometheus-jenkins-dev-key-pair.pub")

  tags = {
    Name    = "${var.project}-${var.environment}-key-pair"
    Project = var.project
    Env     = var.environment
  }
}

module "jenkins-server" {
  source                   = "../../modules/ec2"
  server_subnet_id         = module.vpc.server_subnet_id
  server_security_group_id = module.security_group.jenkins_sg_id
  key_name                 = aws_key_pair.key_pair.key_name

  user_data = <<EOF
#!/bin/bash

# Install Jenkins on Amazon Linux 2
sudo yum update –y

# Add a Jenkins repository.
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import a key file from Jenkins-CI to enable installation from the package:    
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum upgrade

# Install java to run Jenkins
sudo yum install java-17-amazon-corretto -y

# Install Jenkins
sudo yum install jenkins -y

# Enable the Jenkins service to start at boot
sudo systemctl enable jenkins

# Start Jenkins as a service
sudo systemctl start jenkins
  EOF

  project     = var.project
  environment = var.environment
}

module "prometheus-server" {
  source                   = "../../modules/ec2"
  server_subnet_id         = module.vpc.server_subnet_id
  server_security_group_id = module.security_group.promtheus_sg_id
  key_name                 = aws_key_pair.key_pair.key_name

  user_data = <<EOF
#!/bin/bash

# Install Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.29.2/prometheus-2.29.2.linux-amd64.tar.gz
tar -xzf prometheus-2.29.2.linux-amd64.tar.gz
cd prometheus-2.29.2.linux-amd64

# Configure Prometheus
cat > prometheus.yml <<EOL
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'node'
    static_configs:
      - targets: ['localhost:9100']
EOL

# Start Prometheus
nohup ./prometheus > prometheus.log 2>&1 &
EOF

  project     = var.project
  environment = var.environment
}
