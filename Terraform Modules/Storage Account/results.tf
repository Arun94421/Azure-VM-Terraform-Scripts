# outputs.tf - Define outputs for the module

output "storage_account_id" {
  description = "The ID of the created storage account"
  value       = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  description = "The name of the created storage account"
  value       = azurerm_storage_account.storage.name
}
