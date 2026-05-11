output "subnet_ids" {
  value = [aws_subnet.subnet.id]
}

output "subnet_details" {
  value = {
    (var.config.subnet[0].name) = aws_subnet.subnet.id
  }
}
