output "out" {
    value=flatten([for instance in module.vm_instances : instance.fqdn])
}
