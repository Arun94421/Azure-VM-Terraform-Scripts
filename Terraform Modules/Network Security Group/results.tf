# modules/nsg/results.tf

# Output the name of the Network Security Group
output "nsg_name" {
  value       = azurerm_network_security_group.example.name
  description = "The name of the created Network Security Group"
}

# Output the location of the Network Security Group
output "nsg_location" {
  value       = azurerm_network_security_group.example.location
  description = "The location of the Network Security Group"
}

# Output the ID of the Network Security Group
output "nsg_id" {
  value       = azurerm_network_security_group.example.id
  description = "The ID of the created Network Security Group"
}
