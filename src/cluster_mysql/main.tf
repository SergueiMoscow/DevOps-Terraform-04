module "vpc" {
  source      = "../1/modules/vpc"
  env_name = var.env_name
  subnets = [
    {zone = "ru-central1-a", cidr = "10.0.1.0/24"},
  ]
}

module "mysql" {
  source       = "./modules/mysql"
  cluster_name = var.cluster_name
  network_id   = module.vpc.network.id
  subnet_id   = module.vpc.subnet_ids[0]
  ha           = true
}

variable "env_name" {
  type    = string
  default = "dev"
}

variable "cluster_name" {
  type    = string
  default = "example"
}