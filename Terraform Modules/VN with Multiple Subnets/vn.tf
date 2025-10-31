# Resource: Create Virtual Network (VNet)
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
  tags                = var.tags
}

# Resource: Create Subnets using for_each
resource "azurerm_subnet" "subnet" {
  for_each            = var.subnets
  name                = each.value.name
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes    = each.value.address_prefixes

  # Optional: Network Security Group association (if provided in the subnet configuration)
  network_security_group_id = each.value.nsg_id
}
