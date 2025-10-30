# terraform.tfvars

vnet_name           = "my-vnet"
resource_group_name = "my-rg"
location            = "East US"
address_space       = ["10.0.0.0/16"]
subnet_name         = "subnet1"
subnet_address_prefixes = ["10.0.1.0/24"]
tags = {
  "Environment" = "Staging"
  "Project"     = "TerraformVNet"
}
