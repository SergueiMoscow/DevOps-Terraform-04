terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"
}

resource "yandex_mdb_mysql_database" "this" {
  cluster_id = var.cluster_id
  name       = var.database_name
}

resource "yandex_mdb_mysql_user" "this" {
  cluster_id = var.cluster_id
  name       = var.db_user_name
  password   = var.db_user_password

  // Привилегии, которые мы хотим дать пользователю на базе данных
  permission {
    database_name = yandex_mdb_mysql_database.this.name
    roles         = ["ALL", "INSERT"]
  }
}
