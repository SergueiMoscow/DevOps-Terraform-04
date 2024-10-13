terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.129.0"
    }
  }
  required_version = "~>1.8.4"
}


resource "yandex_vpc_security_group" "this" {
  name        = var.security_group_name
  description = "Security group for MDB MySQL"

  network_id = var.network_id

  egress {
    protocol = "tcp"
    ports    = "3306"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    ports    = "3306"
    v4_cidr_blocks = ["10.0.0.0/24"] # использайте необходимый CIDR для вашего случая
  }
}

variable security_group_name {
  type = string
  default = "undefined"
}