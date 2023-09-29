data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # Canonical
  owners = ["099720109477"] 
}

resource "aws_network_interface" "customer_app_instance" {
  count = var.subnet_id != "" ? 1 : 0

  subnet_id   = var.subnet_id
  private_ips = [cidrhost(var.subnet_cidr, 10)]

  tags = var.default_tags
}

resource "aws_instance" "customer_app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  dynamic "network_interface" {
    for_each = aws_network_interface.customer_app_instance[0].id != 0 ? [1] : []

    content {
      network_interface_id = aws_network_interface.customer_app_instance[0].id
       device_index         = 0
    }
  }

  tags =var.default_tags
}