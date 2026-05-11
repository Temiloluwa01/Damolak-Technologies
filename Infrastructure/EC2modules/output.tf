output "instance_ids" {
  value = [aws_instance.ec2.id]
}

output "instance_details" {
  value = {
    (var.config.ec2[0].name) = aws_instance.ec2.id
  }
}

output "public_ip" {
  value       = aws_instance.ec2.public_ip
  description = "Public IP address of the EC2 instance"
}

output "public_dns" {
  value       = aws_instance.ec2.public_dns
  description = "Public DNS name of the EC2 instance"
}
