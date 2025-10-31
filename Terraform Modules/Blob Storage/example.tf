# example.tf

module "azure_blob_storage" {
  source = "./"

  resource_group_name        = "example-resource-group"
  location                   = "East US"
  storage_account_name       = "examplestorageaccount"
  account_tier               = "Standard"
  account_replication_type  = "LRS"
  container_name            = "examplecontainer"
  container_access_type     = "private"
  tags = {
    environment = "production"
    project     = "blob-storage"
  }
}
