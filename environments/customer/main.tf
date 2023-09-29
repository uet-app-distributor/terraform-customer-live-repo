locals {
  default_tags = {
    env = "customer"
  }
}

module "network" {
  source       = "../../modules/aws-vpc"
  cidr_block   = "10.0.0.0/16"
  default_tags = local.default_tags
  enable_ig    = true
}
