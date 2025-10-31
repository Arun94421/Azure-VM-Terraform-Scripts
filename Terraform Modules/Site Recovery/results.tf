# outputs.tf

output "recovery_vault_id" {
  value = azurerm_recovery_services_vault.example.id
}

output "protection_container_id" {
  value = azurerm_site_recovery_protection_container.example.id
}

output "container_mapping_id" {
  value = azurerm_site_recovery_protection_container_mapping.example.id
}
