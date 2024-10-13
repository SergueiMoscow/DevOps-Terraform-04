terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"
}

resource "yandex_mdb_mysql_cluster" "this" {
  name        = var.cluster_name
  environment = var.mysql_environment
  network_id  = var.network_id
  version = "8.0"
  security_group_ids = var.security_group_ids


  resources {
    resource_preset_id = "s2.micro"
    disk_type_id       = "network-ssd"
    disk_size          = 10
  }

  mysql_config = {
    sql_mode                      = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
    max_connections               = 100
    default_authentication_plugin = "MYSQL_NATIVE_PASSWORD"
    innodb_print_all_deadlocks    = true
  }

  dynamic "host" {
    for_each = [
      for i in range(local.host_count) : {
        zone      = var.subnet_zone
        subnet_id = var.subnet_id
      }
    ]
    content {
      zone           = host.value.zone
      subnet_id      = host.value.subnet_id
      assign_public_ip = false
    }
  }
}

locals {
  host_count = var.ha ? 2 : 1
}