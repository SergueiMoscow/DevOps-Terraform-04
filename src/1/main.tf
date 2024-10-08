#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = "develop"
}

#создаем подсеть
resource "yandex_vpc_subnet" "develop_a" {
  name           = "develop-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "develop-ru-central1-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}

# Добавляем переменные
variable "subnet_zones_marketing" {
  type        = list(string)
  default     = ["ru-central1-a", "ru-central1-b"]
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

# variable "instance_params" {
#   type = list(object({
#     project_name   = string
#     labels         = map(string)
#     instance_count = number
#     subnet_zones   = list(string)
#     subnet_ids     = list(string)
#   }))
# }

module "vm_instances" {
  for_each = { for idx, instance in local.instance_params : idx => instance }
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = each.value.project_name 
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = each.value.subnet_zones
  subnet_ids     = each.value.subnet_ids
  instance_name  = each.value.project_name
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
  instance_params = [
    {
      project_name   = "marketing"
      labels         = { owner = "i.ivanov", project = "marketing" }
      instance_count = 1
      subnet_zones   = var.subnet_zones_marketing
      subnet_ids     = [yandex_vpc_subnet.develop_a.id, yandex_vpc_subnet.develop_b.id]
    },
    {
      project_name   = "analytics"
      labels         = { owner = "p.petrov", project = "analytics" }
      instance_count = 1
      subnet_zones   = var.subnet_zones_marketing
      subnet_ids     = [yandex_vpc_subnet.develop_a.id]
    }
  ]
}
