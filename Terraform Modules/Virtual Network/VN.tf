# main.tf


# Resource Group
resource "azurerm_resource_group" "rg_peering" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Virtual Network 1
resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1_name
  address_space       = var.vnet1_address_space
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg_peering.name
}

# Subnet 1
resource "azurerm_subnet" "hub-gateway-subnet" {
  name                 = var.subnet1_name
  resource_group_name  = azurerm_resource_group.rg_peering.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = [var.subnet1_address_prefix]
}

# Virtual Network 2
resource "azurerm_virtual_network" "vnet2" {
  name                = var.vnet2_name
  address_space       = var.vnet2_address_space
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg_peering.name
}

# Subnet 2
resource "azurerm_subnet" "vnet2-subnet2" {
  name                 = var.subnet2_name
  resource_group_name  = azurerm_resource_group.rg_peering.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = [var.subnet2_address_prefix]
}

# Virtual Network 3
resource "azurerm_virtual_network" "vnet3" {
  name                = var.vnet3_name
  address_space       = var.vnet3_address_space
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg_peering.name
}

# Subnet 3
resource "azurerm_subnet" "vnet3-subnet3" {
  name                 = var.subnet3_name
  resource_group_name  = azurerm_resource_group.rg_peering.name
  virtual_network_name = azurerm_virtual_network.vnet3.name
  address_prefixes     = [var.subnet3_address_prefix]
}


