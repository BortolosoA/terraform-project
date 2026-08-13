data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]

  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y git
              cd /home/ubuntu
              git clone ${var.repo_url}
              cd terraform-project
              # Adicione os comandos de instalacao da sua aplicacao aqui
              EOF

  tags = {
    Name = var.instance_name
  }
}