# outputs.tf

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.example.name
}

output "storage_container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.example.name
}
