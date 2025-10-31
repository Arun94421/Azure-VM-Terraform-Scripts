# terraform.tfvars - Example variable values for configuring the Azure Storage Account

# The name of the Resource Group
resource_group_name = "my-example-resource-group"

# The Azure region where the resources will be created
location = "East US"

# The name of the Storage Account (must be globally unique)
storage_account_name = "examplestorageacct123"

# The performance tier of the Storage Account (Standard or Premium)
account_tier = "Standard"

# The replication type for the Storage Account (LRS, GRS, ZRS, RA-GRS, etc.)
account_replication_type = "LRS"
