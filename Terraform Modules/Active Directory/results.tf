# Output the Active Directory ID
output "ad_id" {
  description = "The ID of the Active Directory"
  value       = azurerm_active_directory.example.id
}

# Output the Service Principal ID
output "service_principal_id" {
  description = "ID of the Service Principal"
  value       = azurerm_service_principal.example.id
}
