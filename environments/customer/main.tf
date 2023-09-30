locals {}

module "network" {
  source     = "../../modules/aws-vpc"
  cidr_block = "10.0.0.0/16"
  enable_ig  = true
}

module "compute" {
  source            = "../../modules/aws-ec2"
  subnet_id         = module.network.public_subnet_id
  vpc_id            = module.network.vpc_id
  enabled_public_ip = true

  # Customized AMI with required services pre-installed
  instance_ami = "ami-095a50fd682616906"

  # Orchestrator public SSH key
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcDqGm9ycPKj5oe8nokbFu3XvbOhJtvCzDSPd36hYj4sUYl6VkQHu9NR8dZ9Qk9BxDLpoWm3OwQ03ThltaxmY7jLle650ndKvU8ns4dFy91PC09N5VeZvk+4GAIv4sthdBOlKv7UegaBkBA5PYonyVVIZPc1ZzybFefOKL6VK+gEzevEmQu3WAP3OO5Gsm4/o3racFWYAO0qajU4j7RmCD/ZM366IotNEl3qdUHWI7DaE7M7+uPPyhV7t0wfUxQoY6oTXgAszGcgZz6MTmQQQmJJJSdQt+3uvjYunAdwuabTZ8/p90tx7LWCznXoQSF/YU6E92NO/W5JhPKm3y/4tWADJYzHoaQiLuLSkSvfTKcsFNZVRC8uIBaFduBULA5+wGfM5tTZOhB4UMsV09v3PrG05m1sZUnBmsa5M856NZYlJSrr+DNuhU0xfxJ+8CzHLVOrl3/3XCcId48khlGV4E7CAz/zPjTOJCXj5s4pKPYv871/vzFmwS6asbCMh2QVk= thainm.uet@gmail.com"
}
