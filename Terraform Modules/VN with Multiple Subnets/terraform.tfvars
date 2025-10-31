vnet_name            = "my-vnet"
location            = "East US"
resource_group_name = "my-resource-group"
vnet_address_space   = ["10.0.0.0/16"]

subnets = {
  "subnet-frontend" = {
    name            = "subnet-frontend"
    address_prefixes = ["10.0.1.0/24"]
    nsg_id          = ""  # Optional: Replace with NSG ID if needed
  },
  "subnet-backend" = {
    name            = "subnet-backend"
    address_prefixes = ["10.0.2.0/24"]
    nsg_id          = ""  # Optional: Replace with NSG ID if needed
  }
}

tags = {
  environment = "development"
  project     = "vnet-setup"
}
