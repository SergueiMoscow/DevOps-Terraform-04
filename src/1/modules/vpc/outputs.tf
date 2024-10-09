output "network" {
  description = "The ID of the network"
  value       = yandex_vpc_network.this
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = flatten([for subnet_info in yandex_vpc_subnet.this: subnet_info.id])
}

output "subnet_zones" {
  description = "List of subnet zones"
  value       = flatten([for subnet_info in yandex_vpc_subnet.this: subnet_info.zone])
}
