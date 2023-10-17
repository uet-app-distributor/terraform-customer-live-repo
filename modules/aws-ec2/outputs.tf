output "customer_app_instance_public_ip" {
  value = aws_eip.customer_app_instance[0].public_ip
}