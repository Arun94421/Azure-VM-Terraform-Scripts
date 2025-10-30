# variables.tf

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group."
  type        = string
}

variable "location" {
  description = "The Azure location where the Key Vault will be created."
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID for Azure Active Directory."
  type        = string
}

variable "admin_username" {
  description = "Admin username to be stored in the Key Vault."
  type        = string
}

variable "ssh_key" {
  description = "The SSH key to be stored in the Key Vault."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the Key Vault."
  type        = map(string)
  default     = {}
}
