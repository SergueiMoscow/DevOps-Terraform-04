output "cluster_id" {
  description = "Created MySQL cluster ID"
  value       = yandex_mdb_mysql_cluster.this.id
}

output "cluster_name" {
  description = "Created MySQL cluster name"
  value       = yandex_mdb_mysql_cluster.this.name
}