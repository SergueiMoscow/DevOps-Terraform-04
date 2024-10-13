# To always have a unique bucket name in this example
resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

module "s3" {
  source = "git::https://github.com/terraform-yc-modules/terraform-yc-s3.git?ref=bb05dc3887e44fe53e103d521bad0894117d25e8"
  bucket_name = "sergio"
  folder_id = var.folder_id
}