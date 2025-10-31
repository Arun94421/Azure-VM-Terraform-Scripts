# Output for VNet ID
output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.main.id
}

# Output for Subnet IDs
output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = [for s in azurerm_subnet.subnet : s.id]
}

# Output for Subnet Names
output "subnet_names" {
  description = "The names of the created subnets"
  value       = [for s in azurerm_subnet.subnet : s.name]
}
