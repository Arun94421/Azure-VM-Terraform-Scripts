resource_group_name  = "my-terraform-rg"
location             = "eastus"
vnet_name            = "my-vnet"
vnet_address_space   = ["10.0.0.0/16"]
subnet_name          = "my-subnet"
subnet_address_prefixes = ["10.0.1.0/24"]

vm_name        = "my-linux-vm"
vm_size        = "Standard_B2s"
admin_username = "azureuser"

# Storage account name must be globally unique, 3-24 lowercase letters and numbers
storage_account_name     = "mystorageacct12345"
container_name           = "mydata"
account_tier             = "Standard"
account_replication_type = "LRS"

tags = {
  Environment = "Development"
  Project     = "TerraformDemo"
  ManagedBy   = "Terraform"
}
