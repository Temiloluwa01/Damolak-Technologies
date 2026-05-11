resource "aws_instance" "ec2" {
  ami                    = var.config.ec2[0].ami
  instance_type          = var.config.ec2[0].instance_type
  key_name               = aws_key_pair.ec2.key_name
  associate_public_ip_address = true

  subnet_id = var.subnet_id

  vpc_security_group_ids = var.security_group_ids

  tags = merge(
    {
      Name = var.config.ec2[0].name
    },
    var.config.ec2[0].tags
  )
}


