#resource "aws_3instance" "ec2" {
#  for_each = {
#    for x in var.config.ec2 : x.name => x
#  }

#  ami           = each.value.ami
#  instance_type = each.value.instance_type
#  subnet_id     = each.value.subnet_id
#  key_name      = each.value.key_name
#
#  vpc_security_group_ids = each.value.security_group_ids

#  tags = merge(
#    {
#      Name = each.value.name
#    },
#    each.value.tags
#  )
#}


resource "aws_instance" "ec2" {
  ami           = var.config.ec2[0].ami
  instance_type = var.config.ec2[0].instance_type
  key_name      = var.config.ec2[0].key_name != null ? var.config.ec2[0].key_name : null

  subnet_id = var.subnet_id

  vpc_security_group_ids = var.security_group_ids

  tags = merge(
    {
      Name = var.config.ec2[0].name
    },
    var.config.ec2[0].tags
  )
}
