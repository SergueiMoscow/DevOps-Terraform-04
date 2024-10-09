output "instances" {
    value=flatten([for instance in module.vm_instances : instance.fqdn])
}

output "vpc" {
  value = {
    network     = module.vpc.network,
    subnet_ids  = module.vpc.subnet_ids
    subnet_ones = module.vpc.subnet_zones
  }
}
