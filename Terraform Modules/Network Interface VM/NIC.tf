# Resource: Network Interface
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    private_ip_address_allocation = "Dynamic"
    subnet_id                    = var.subnet_id
  }
}
