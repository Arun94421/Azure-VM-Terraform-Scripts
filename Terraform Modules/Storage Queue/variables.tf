# variables.tf

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Azure storage account"
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account (e.g., Standard or Premium)"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication strategy for the storage account (e.g., LRS, GRS, ZRS)"
  type        = string
  default     = "LRS"
}

variable "queue_name" {
  description = "The name of the storage queue"
  type        = string
}

variable "queue_metadata" {
  description = "A map of metadata to associate with the storage queue"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
