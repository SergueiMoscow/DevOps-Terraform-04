variable "env_name" {
  type = string
  default = "undefined"
  description = "base name for net and subnet(s)"
}

variable "subnets" {
  description = "List of subnets with zones and CIDR blocks"
  type = list(object({
    zone = string
    cidr = string
  }))
}