# Resource Group & Location
variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

# Virtual Network Configuration
variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
}

variable "public_subnet_prefix" {
  description = "The address prefix for the public subnet"
  type        = list(string)
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
}

variable "private_subnet_prefix" {
  description = "The address prefix for the private subnet"
  type        = list(string)
}

# VM Configuration
variable "vm_name" {
  description = "The name of the Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
}

# Key Vault Integration - Secrets
variable "key_vault_name" {
  description = "The name of the Azure Key Vault"
  type        = string
}

variable "key_vault_rg_name" {
  description = "The resource group name where the Key Vault is located"
  type        = string
}

variable "key_vault_admin_username_secret_name" {
  description = "The name of the secret in Key Vault that holds the VM admin username"
  type        = string
}

variable "key_vault_ssh_key_secret_name" {
  description = "The name of the secret in Key Vault that holds the SSH public key"
  type        = string
}

# VM Image Configuration
variable "vm_image" {
  description = "The configuration for the VM image (publisher, offer, sku, version)"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

# Tags (Optional)
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
