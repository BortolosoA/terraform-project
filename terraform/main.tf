provider "aws" {
  region = var.aws_region
}

# Chamada do modulo de Security Group
module "security_group" {
  source  = "./modules/security_group"
  sg_name = "meu_sg_app"
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
    ${module.ec2.public_ip}
  EOF

  # O caminho onde o Terraform vai salvar o arquivo (ajuste conforme suas pastas)
  filename = "${path.module}/../ansible/inventory/inventory.ini"
}