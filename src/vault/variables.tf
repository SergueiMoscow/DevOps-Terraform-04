variable "secret_example_path" {
  type    = string
  default = "secret/example"
}

variable "secret_example2_path" {
  type    = string
  default = "secret/example2"
}

variable "secret_example2_value" {
  type    = map
  default = {
    new_key = "new value"
  }
}