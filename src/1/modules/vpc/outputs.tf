output "network" {
  description = "The ID of the network"
  value       = yandex_vpc_network.this
}

output "subnet" {
  description = "The ID of the subnet"
  value       = yandex_vpc_subnet.this
}
