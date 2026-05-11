resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.config.subnet[0].cidr_block
  availability_zone = var.config.subnet[0].availability_zone

  map_public_ip_on_launch = var.config.subnet[0].public

  tags = merge(
    {
      Name = var.config.subnet[0].name
    },
    var.config.subnet[0].tags
  )
}

# Associate route table with public subnets
resource "aws_route_table_association" "public" {
  count = var.config.subnet[0].public ? 1 : 0

  subnet_id      = aws_subnet.subnet.id
  route_table_id = var.route_table_id
}