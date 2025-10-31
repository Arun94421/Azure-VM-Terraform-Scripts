# Variable for the VNet Name
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

# Variable for Location of the resources
variable "location" {
  description = "The Azure location where the resources will be deployed"
  type        = string
}

# Variable for Resource Group Name
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# Variable for VNet Address Space
variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

# Variable for Subnet Configuration (Using for_each for dynamic creation of subnets)
variable "subnets" {
  description = "Map of subnets where each subnet contains name, address prefixes, and optional NSG ID"
  type = map(object({
    name            = string
    address_prefixes = list(string)
    nsg_id          = string
  }))
  default = {}
}

# Tags to be applied to the resources
variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}
