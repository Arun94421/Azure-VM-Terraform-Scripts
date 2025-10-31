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
