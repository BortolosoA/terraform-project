output "ip_de_acesso" {
  description = "Acesse sua aplicacao por este IP"
  value       = module.ec2.public_ip
}