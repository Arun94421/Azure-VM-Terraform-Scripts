# Variables
variable "nic_name" {
  description = "The name of the Network Interface"
  type        = string
}

variable "location" {
  description = "The Azure location where the resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "ip_configuration_name" {
  description = "The name of the IP Configuration"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to associate with the NIC"
  type        = string
}

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

# Outputs
output "nic_id" {
  description = "The ID of the Network Interface"
  value       = azurerm_network_interface.nic.id
}

output "nic_private_ip" {
  description = "The private IP address of the Network Interface"
  value       = azurerm_network_interface.nic.private_ip_address
}
