output "instances" {
    value=flatten([for instance in module.vm_instances : instance.fqdn])
}

output "vpc" {
  value = {
    network = module.vpc_dev.network,
    subnet = module.vpc_dev.subnet
  }
}
