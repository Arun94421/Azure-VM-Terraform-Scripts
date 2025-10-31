# Create Storage Account
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name       = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier              = var.account_tier
  account_replication_type = var.account_replication_type

  tags = var.tags
}

# Create Storage Queue
resource "azurerm_storage_queue" "example" {
  name                  = var.queue_name
  storage_account_name  = azurerm_storage_account.example.name
  metadata              = var.queue_metadata
}
