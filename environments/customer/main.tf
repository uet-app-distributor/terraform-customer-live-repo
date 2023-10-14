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
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDXNbfWr/yz5V0q4w6O+LeWWDINKvvg/pDcawaHJ+b36nGbUwO5tv963kzHZjdWaZwl5MRNJTFIflX4Ho37gCTqf25/pGGduqy33H5wF7CF6GqvyDRhV/VDqSFVhNhxr/QOFpadJqdt+Ji9xsCi515NZWANnCSice+jjKYiHf9y5TbW1V5f2WAxsPLSs1bRUmIpvyUul1q7j6oTEcv/SdF0wQcxn00bfYkG0VIkcy34owejWa/+bXKUtUNITe4AL/ds5FLX8cpukk58Dwwk68lr2tj5XxijAbQ9xcHF6OEGPO81Dn0YButKRC6i4yLk/98gj7rYgch6Q9KZM0m1UY89ZJk4l2v/Vzj2f7EhAc/luAk5KCHyPodBgwkQFyC+lyr5WUBWGIHth1Kc66SthXDL3hLuPokBlkvZ4xOTX/ZunP4PnlPKB6I2ezBjxMSNNjI6F8n7P0onYPtVY7zx/dQojtFMiYXoZGytuLB5R1uJ4nBrKlhojMFoPGo9qA7GiYs= thainm.uet@gmail.com"
}
