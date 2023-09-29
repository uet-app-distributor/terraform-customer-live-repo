resource "aws_vpc" "customer" {
  cidr_block = var.cidr_block
  tags       = var.vpc_tags
}