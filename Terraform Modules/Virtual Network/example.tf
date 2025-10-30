# example.tf

module "vnet" {
  source              = "./modules/vnet"  # Path to the VNet module
  vnet_name           = "my-terraform-vnet"
  resource_group_name = "my-resource-group"
  location            = "East US"
  address_space       = ["10.0.0.0/16"]
  subnet_name         = "my-subnet"
  subnet_address_prefixes = ["10.0.1.0/24"]
  tags = {
    "Environment" = "Production"
    "Project"     = "VNetExample"
  }
}

output "vnet_id" {
  value = module.vnet.vnet_id
}

output "subnet_id" {
  value = module.vnet.subnet_id
}
