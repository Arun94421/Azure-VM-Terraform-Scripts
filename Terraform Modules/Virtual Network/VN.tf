# main.tf


#creating a azure resource group
resource "azurerm_resource_group" "rg_peering" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

