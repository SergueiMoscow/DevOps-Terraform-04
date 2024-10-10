output "database_name" {
  description = "The name of the created database"
  value       = yandex_mdb_mysql_database.this.name
}

output "db_user_name" {
  description = "The name of the created user"
  value       = yandex_mdb_mysql_user.this.name
}