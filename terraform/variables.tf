variable "aws_region" {
  description = "Regiao da AWS"
  type        = string
  default     = "us-east-1"
}

variable "repo_url" {
  description = "Repositorio da aplicacao"
  type        = string
  default     = "https://github.com/BortolosoA/terraform-project.git"
}

# Adicione a variavel da chave aqui
variable "key_name" {
  description = "Nome da chave SSH passada pelo .env"
  type        = string
}