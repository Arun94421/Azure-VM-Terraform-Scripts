# variables.tf - Define all variables

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Azure Storage Account"
  type        = string
  min_length  = 3
  max_length  = 24
  pattern     = "^[a-z0-9]{3,24}$" # Azure storage account name pattern
}

variable "account_tier" {
  description = "The performance tier of the storage account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication strategy for the storage account"
  type        = string
  default     = "LRS"
}
