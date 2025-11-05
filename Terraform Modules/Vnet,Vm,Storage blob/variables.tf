variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "main-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "main-subnet"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "main-vm"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "storage_account_name" {
  description = "Name of the storage account (must be globally unique)"
  type        = string
}

variable "container_name" {
  description = "Name of the blob container"
  type        = string
  default     = "data"
}

variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}
