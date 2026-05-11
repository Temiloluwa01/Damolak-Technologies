output "ec2_instance_id" {
  value       = module.ec2.instance_ids[0]
  description = "EC2 instance ID for deployment"
}

output "ec2_public_ip" {
  value       = module.ec2.public_ip
  description = "Public IP address for EC2 deployment"
}

output "ec2_public_dns" {
  value       = module.ec2.public_dns
  description = "Public DNS for EC2 deployment"
}
output "ec2_private_key_pem" {
  value       = module.ec2.private_key_pem
  sensitive   = true
  description = "Private key for EC2 SSH access"
}

output "ec2_key_pair_name" {
  value       = module.ec2.key_pair_name
  description = "Name of the SSH key pair"
}
