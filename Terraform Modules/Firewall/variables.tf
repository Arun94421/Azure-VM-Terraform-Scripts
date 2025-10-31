# modules/azure_firewall/variables.tf
variable "firewall_name" {
  description = "Name of the Azure Firewall"
  type        = string
}

variable "location" {
  description = "Azure region where the firewall will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the Azure Firewall will be deployed"
  type        = string
}
