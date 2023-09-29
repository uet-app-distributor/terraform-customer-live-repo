resource "aws_vpc" "customer" {
  cidr_block = var.cidr_block

  tags = merge(var.vpc_tags, var.default_tags)
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.customer.id
  cidr_block = cidrsubnet(aws_vpc.customer.cidr_block, 4, 15)

  tags = merge(var.subnet_tags, var.default_tags)
}