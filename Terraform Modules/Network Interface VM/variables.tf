# Variable for Network Interface Name
variable "nic_name" {
  description = "The name of the Network Interface"
  type        = string
}

# Variable for Azure Location
variable "location" {
  description = "The Azure location where the resources will be deployed"
  type        = string
}

# Variable for Resource Group Name
variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

# Variable for IP Configuration Name
variable "ip_configuration_name" {
  description = "The name of the IP Configuration"
  type        = string
}

# Variable for Subnet ID
variable "subnet_id" {
  description = "The subnet ID to associate with the NIC"
  type        = string
}
