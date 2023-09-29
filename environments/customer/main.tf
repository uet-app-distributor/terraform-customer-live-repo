locals {}

module "network" {
  source     = "../../modules/aws-vpc"
  cidr_block = "10.0.0.0/16"
  enable_ig  = true
}

module "compute" {
  source            = "../../modules/aws-ec2"
  subnet_id         = module.network.subnet_id
  subnet_cidr       = module.network.subnet_cidr
  enabled_public_ip = true
}
