module "vnet_with_subnets" {
  source = "./"

  # VNet Name
  vnet_name             = "example-vnet"

  # Resource Group Name
  resource_group_name   = "example-resource-group"

  # Azure Location
  location              = "East US"

  # Address Space for the VNet
  vnet_address_space    = ["10.0.0.0/16"]

  # Subnet Configuration
  subnets = [
    {
      name            = "subnet-1"
      address_prefix  = "10.0.1.0/24"
      nsg_id          = "/subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Network/networkSecurityGroups/{nsg-name}"
    },
    {
      name            = "subnet-2"
      address_prefix  = "10.0.2.0/24"
      nsg_id          = "/subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Network/networkSecurityGroups/{nsg-name}"
    }
  ]

  # Tags to be applied to the resources
  tags = {
    environment = "development"
    project     = "vnet-setup"
  }
}
