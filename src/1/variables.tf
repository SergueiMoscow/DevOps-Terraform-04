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

variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "https://yandex.cloud/ru/docs/compute/concepts/image"
}

variable "vms_ssh_user" {
  type        = string
  default     = "ubuntu"
  description = "username for ssh"
}

variable "ssh_public_key_file" {
  type        = string
  description = "Filename with public key"
}