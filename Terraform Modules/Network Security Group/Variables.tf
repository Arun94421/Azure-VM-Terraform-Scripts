# modules/nsg/variables.tf

# The name of the Network Security Group (NSG)
variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
}

# The location to create the Network Security Group
variable "location" {
  description = "The Azure region to create the Network Security Group in"
  type        = string
}

# A list of security rules for the Network Security Group
variable "security_rules" {
  description = "A list of security rules to be applied to the NSG"
  type = list(object({
    name                       = string
    priority                  = number
    direction                 = string
    access                    = string
    protocol                  = string
    source_port_range         = string
    destination_port_range    = string
    source_address_prefix     = string
    destination_address_prefix = string
  }))
  default = []
}

# Optional: Tags to apply to the NSG
variable "tags" {
  description = "Tags to be applied to the Network Security Group"
  type        = map(string)
  default     = {}
}
