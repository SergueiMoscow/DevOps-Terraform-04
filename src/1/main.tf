module "vpc" {
     source      = "./modules/vpc"
     env_name = "develop"
     subnets = [
      {zone = "ru-central1-a", cidr = "10.0.1.0/24"},
      {zone = "ru-central1-b", cidr = "10.0.2.0/24"},
     ]
   }

module "vm_instances" {
  for_each = local.instance_params
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = each.key
  network_id     = module.vpc.network.id
  subnet_zones   = each.value.subnet_zones
  subnet_ids     = each.value.subnet_ids
  instance_name  = each.key
  instance_count = each.value.instance_count
  image_family   = var.image_family
  public_ip      = true
  labels = each.value.labels
  metadata = local.vm_metadata
}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
    username           = var.vms_ssh_user
    ssh_public_key     = file(var.ssh_public_key_file)
  }
}

locals {
  instance_params = {
    "marketing" = {
      labels         = { owner = "i.ivanov", project = "marketing" }
      instance_count = 1
      subnet_zones   = module.vpc.subnet_zones
      subnet_ids     = module.vpc.subnet_ids
    },
    "analytics" = {
      project_name   = "analytics"
      labels         = { owner = "p.petrov", project = "analytics" }
      instance_count = 1
      subnet_zones   = module.vpc.subnet_zones
      subnet_ids     = module.vpc.subnet_ids
    }
  }
}