# example.tf

module "nsg" {
  source          = "./modules/nsg"  # Path to the NSG module
  nsg_name        = "example-nsg"    # Name of the NSG
  location        = "East US"        # Azure region
  resource_group_name = "my-resource-group"  # The resource group to associate the NSG
  security_rules = [
    {
      name                       = "Allow-SSH"
      priority                  = 100
      direction                 = "Inbound"
      access                    = "Allow"
      protocol                  = "Tcp"
      source_port_range         = "*"
      destination_port_range    = "22"
      source_address_prefix     = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-HTTP"
      priority                  = 200
      direction                 = "Inbound"
      access                    = "Allow"
      protocol                  = "Tcp"
      source_port_range         = "*"
      destination_port_range    = "80"
      source_address_prefix     = "*"
      destination_address_prefix = "*"
    }
  ]
  tags = {
    "Environment" = "Development"
    "Project"     = "NSGExample"
  }
}

# Output the results from the module
output "nsg_name" {
  value = module.nsg.nsg_name
}

output "nsg_location" {
  value = module.nsg.nsg_location
}

output "nsg_id" {
  value = module.nsg.nsg_id
}
