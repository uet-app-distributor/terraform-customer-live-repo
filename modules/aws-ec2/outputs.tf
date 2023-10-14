output "customer_app_instance_public_ip" {
  value = ${aws_instance.customer_app_instance.public_ip}
}