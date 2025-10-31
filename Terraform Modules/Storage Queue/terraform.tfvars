# terraform.tfvars

resource_group_name        = "my-resource-group"
location                   = "East US"
storage_account_name       = "examplestorageacct"
account_tier               = "Standard"
account_replication_type  = "LRS"
queue_name                 = "myqueue"
queue_metadata = {
  environment = "production"
  app         = "queue-app"
}
tags = {
  environment = "production"
  project     = "azure-queue"
}
