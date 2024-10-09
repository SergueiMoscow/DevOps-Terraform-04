terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"
}

resource "yandex_vpc_network" "this" {
  name = var.env_name
}

# Создание списка подсетей
resource "yandex_vpc_subnet" "this" {
  for_each = { for subnet in var.subnets : subnet.zone => subnet }
  name           = "${var.env_name}-${each.key}"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = [each.value.cidr]
}