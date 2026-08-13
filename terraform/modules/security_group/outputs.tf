output "security_group_id" {
  description = "ID do Security Group criado"
  value       = aws_security_group.web_sg.id
}