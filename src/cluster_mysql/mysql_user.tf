variable database_name {
  type = string
  default = "test_db"
}

variable db_user_name {
  type    = string
  default = "user_dev"
}

variable db_user_password {
  type    = string
  default = "VeryStrongMySQL_UserPassword"
}


module "mysql_db_user" {
  source        = "./modules/mysql_db_user"
  cluster_id    = module.mysql.cluster_id
  database_name = var.database_name
  db_user_name     = var.db_user_name
  db_user_password = var.db_user_password
}
