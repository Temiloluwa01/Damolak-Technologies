output "instance_ids" {
  value = [aws_instance.ec2.id]
}

output "instance_details" {
  value = {
    (var.config.ec2[0].name) = aws_instance.ec2.id
  }
}
