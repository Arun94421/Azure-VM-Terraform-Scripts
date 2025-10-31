# variables.tf

variable "recovery_vault_name" {
  description = "Name of the recovery services vault."
  type        = string
}

variable "location" {
  description = "Location of the Azure resources."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
}

variable "container_name" {
  description = "Name for the protection container."
  type        = string
}

variable "fabric_name" {
  description = "The fabric name for Site Recovery."
  type        = string
}

variable "container_mapping_name" {
  description = "Name for the protection container mapping."
  type        = string
}
