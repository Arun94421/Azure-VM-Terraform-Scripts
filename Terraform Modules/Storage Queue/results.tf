output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.example.name
}

output "storage_queue_name" {
  description = "The name of the storage queue"
  value       = azurerm_storage_queue.example.name
}
