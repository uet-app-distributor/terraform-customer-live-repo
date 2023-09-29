output "subnet_id" {
  value       = aws_subnet.public.id
  description = "ID of the public subnet"
}

output "subnet_cidr" {
  value       = aws_subnet.public.cidr_block
  description = "CIDR of the public subnet"
}
