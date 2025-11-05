output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.vnet.vnet_id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = module.vnet.vnet_name
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = module.vnet.subnet_id
}

output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = module.vm.public_ip_address
}

output "vm_private_ip" {
  description = "Private IP address of the VM"
  value       = module.vm.private_ip_address
}

output "vm_id" {
  description = "ID of the virtual machine"
  value       = module.vm.vm_id
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = module.storage.storage_account_name
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint of the storage account"
  value       = module.storage.primary_blob_endpoint
}

output "container_name" {
  description = "Name of the blob container"
  value       = module.storage.container_name
}
