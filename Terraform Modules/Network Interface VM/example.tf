# Example configuration to create Network Interface (NIC)
module "network_interface" {
  source              = "./"
  nic_name            = "example-nic"
  location            = "East US"
  resource_group_name = "example-resource-group"
  ip_configuration_name = "example-ip-config"
  subnet_id           = "/subscriptions/your-subscription-id/resourceGroups/example-resource-group/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/example-subnet"
}

output "nic_id" {
  value = module.network_interface.azurerm_network_interface.nic.id
}

output "nic_private_ip" {
  value = module.network_interface.azurerm_network_interface.nic.private_ip_address
}
