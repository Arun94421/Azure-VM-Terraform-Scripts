module "azure_storage_queue" {
  source = "./"

  resource_group_name        = "example-resource-group"
  location                   = "East US"
  storage_account_name       = "examplestorageacct"
  account_tier               = "Standard"
  account_replication_type  = "LRS"
  queue_name                 = "examplequeue"
  queue_metadata = {
    environment = "production"
    app         = "queue-app"
  }
  tags = {
    environment = "production"
    project     = "queue-storage"
  }
}
