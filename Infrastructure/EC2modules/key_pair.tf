# Generate a private key for EC2 access
resource "tls_private_key" "ec2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the AWS key pair
resource "aws_key_pair" "ec2" {
  key_name   = "${var.config.ec2[0].name}-key"
  public_key = tls_private_key.ec2.public_key_openssh

  tags = merge(
    {
      Name = "${var.config.ec2[0].name}-key"
    },
    var.config.ec2[0].tags
  )
}

# Output the private key (will be used for GitHub Actions)
output "private_key_pem" {
  value       = tls_private_key.ec2.private_key_pem
  sensitive   = true
  description = "Private key for EC2 SSH access"
}

# Output the key pair name
output "key_pair_name" {
  value       = aws_key_pair.ec2.key_name
  description = "Name of the SSH key pair"
}
