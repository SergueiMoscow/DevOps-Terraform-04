variable "network_name" {
  description = "The name of the network to be created"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet to be created"
  type        = string
}

variable "zone" {
  description = "The zone in which to create the subnet"
  type        = string
}

variable "v4_cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
}