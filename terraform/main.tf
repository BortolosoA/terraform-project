provider "aws" {
  region = var.aws_region
}

# Chamada do modulo de Security Group
resource "aws_security_group" "sg_korp" {
  name        = "korp-sg"
  description = "Security group para projeto Korp"

  # Porta do NGINX
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Porta do Grafana
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Porta do Prometheus
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Chamada do modulo de EC2
module "ec2" {
  source            = "./modules/ec2"
  instance_type     = "t3.micro"
  security_group_id = module.security_group.security_group_id
  repo_url          = var.repo_url
  instance_name     = "Projeto-Korp"
  key_name          = var.key_name
}
resource "local_file" "ansible_inventory" {
  # O conteudo que sera escrito no arquivo
  content = <<-EOF
    [korp]
    svr-01 ansible_host=${module.ec2.public_ip}
  EOF

  # O caminho onde o Terraform vai salvar o arquivo (ajuste conforme suas pastas)
  filename = "${path.module}/../ansible/inventory/inventory.ini"
}