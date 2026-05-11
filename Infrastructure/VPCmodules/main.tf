resource "aws_vpc" "vpc" {
  cidr_block           = var.config.vpc[0].cidr_block
  enable_dns_support   = var.config.vpc[0].enable_dns_support
  enable_dns_hostnames = var.config.vpc[0].enable_dns_hostnames

  tags = merge(
    {
      Name = var.config.vpc[0].name
    },
    var.config.vpc[0].tags
  )
}

# Internet Gateway for public access
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    {
      Name = "${var.config.vpc[0].name}-igw"
    },
    var.config.vpc[0].tags
  )
}

# Route Table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block      = "0.0.0.0/0"
    gateway_id      = aws_internet_gateway.igw.id
  }

  tags = merge(
    {
      Name = "${var.config.vpc[0].name}-public-rt"
    },
    var.config.vpc[0].tags
  )
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "route_table_id" {
  value = aws_route_table.public.id
}