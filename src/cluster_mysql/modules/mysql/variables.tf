variable "mysql_environment" {
  description = "PRODUCTION, PRESTABLE, ENVIRONMENT_UNSPECIFIED"
  type        = string
  default     = "PRESTABLE"
}

variable "cluster_name" {
  description = "MySQL cluster name"
  type        = string
}

variable "network_id" {
  description = "Network ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "subnet_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "ha" {  # High-Availability
  description = "Enable or disable high availability"
  type        = bool
  default     = false
}
