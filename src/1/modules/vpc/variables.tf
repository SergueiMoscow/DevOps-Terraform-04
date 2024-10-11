###cloud vars
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

### module vars
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

variable "bucket_info" {
  type = map
}