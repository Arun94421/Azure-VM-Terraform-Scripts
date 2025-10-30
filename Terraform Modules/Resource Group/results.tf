# modules/resource_group/results.tf

# Output the name of the created resource group
output "resource_group_name" {
  value = azurerm_resource_group.example.name
  description = "The name of the Azure Resource Group"
}

# Output the location of the created resource group
output "resource_group_location" {
  value = azurerm_resource_group.example.location
  description = "The location where the Azure Resource Group was created"
}

# Output the ID of the created resource group
output "resource_group_id" {
  value = azurerm_resource_group.example.id
  description = "The ID of the Azure Resource Group"
}

