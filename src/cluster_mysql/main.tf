module "vpc" {
  source      = "../1/modules/vpc"
  cloud_id    = var.cloud_id
  folder_id   = var.folder_id
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
  security_group_ids = [yandex_vpc_security_group.mysql_security_group.id]
}

resource "yandex_vpc_security_group" "mysql_security_group" {
  name        = "my-db-security-group"
  description = "Security group for MDB MySQL"

  network_id = module.vpc.network.id

  egress {
    protocol = "tcp"
    port    = "3306"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    port    = "3306"
    v4_cidr_blocks = ["10.0.0.0/24"]
  }
}

variable "env_name" {
  type    = string
  default = "dev"
}

variable "cluster_name" {
  type    = string
  default = "example"
}