variable "instance_type" {
  description = "Tipo da instancia EC2"
  type        = string
}

variable "security_group_id" {
  description = "ID do Security Group associado a instancia"
  type        = string
}

variable "repo_url" {
  description = "URL do repositorio GitHub para clonar"
  type        = string
}

variable "instance_name" {
  description = "Nome da instancia (Tag Name)"
  type        = string
  default     = "App-BortolosoA"
}

variable "key_name" {
  description = "Nome da chave SSH cadastrada na AWS"
  type        = string
}