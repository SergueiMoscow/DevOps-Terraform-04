variable "cluster_id" {
  description = "The ID of the existing MySQL cluster"
  type        = string
}

variable "database_name" {
  description = "The name of the database to create"
  type        = string
}

variable "db_user_name" {
  description = "The name of the user to create"
  type        = string
}

variable "db_user_password" {
  description = "The password of the user"
  type        = string
}