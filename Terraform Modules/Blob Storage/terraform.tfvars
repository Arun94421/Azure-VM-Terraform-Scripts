# terraform.tfvars

resource_group_name        = "my-resource-group"
location                   = "East US"
storage_account_name       = "mystorageaccount"
account_tier               = "Standard"
account_replication_type  = "LRS"
container_name            = "mycontainer"
container_access_type     = "private"
tags = {
  environment = "production"
  project     = "blob-storage"
}
