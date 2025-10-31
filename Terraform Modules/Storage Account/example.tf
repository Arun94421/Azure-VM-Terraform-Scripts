# example.tf - Example usage of the Azure Storage Account Terraform Module

# Using the Azure Storage Account Module
module "azure_storage" {
  # Path to the module where you defined the storage account
  source                = "./path/to/azure_storage_account_module"
  
  # Variables required by the module
  resource_group_name   = "example-resource-group"    # The resource group to place the storage account in
  location              = "East US"                    # The Azure region where the storage account will be created
  storage_account_name  = "examplestorageacct123"      # The unique name of the Azure Storage Account (must be globally unique)
  account_tier           = "Standard"                   # The performance tier of the storage account (Standard or Premium)
  account_replication_type = "LRS"                     # The replication strategy (LRS, GRS, ZRS, etc.)
}

# Output the results after the module has been applied
output "storage_account_id" {
  description = "The ID of the created storage account"
  value       = module.azure_storage.storage_account_id
}

output "storage_account_name" {
  description = "The name of the created storage account"
  value       = module.azure_storage.storage_account_name
}
