# modules/resource_group/variables.tf

# Define the name of the Resource Group
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# Define the location of the Resource Group
variable "location" {
  description = "The Azure region to create the resource group in"
  type        = string
}

# Optional: Add tags to the resource group
variable "tags" {
  description = "Tags to be applied to the resource group"
  type        = map(string)
  default     = {}
}
