locals {
  platform_bucket = "uet-app-distributor"
}

module "providers" {
  source = "./modules/providers"
}

module "iam" {
  source = "./modules/google-cloud-iam"

  depends_on = [module.providers]
}

module "cloud_storage" {
  source = "./modules/google-cloud-storage"

  default_buckets = [
    local.platform_bucket
  ]

  empty_folders = [
    "${local.platform_bucket}/customer_apps",
    "${local.platform_bucket}/deployments"
  ]
}

module "network" {
  source                           = "./modules/google-network"
  network_name                     = "uet-app-distributor"
  enable_instance_static_public_ip = true

  depends_on = [module.providers]
}
