# terraform.tfvars

# Override the variables if needed
nsg_name           = "my-custom-nsg"
location           = "West US"
resource_group_name = "my-custom-rg"
security_rules = [
  {
    name                       = "Allow-HTTPS"
    priority                  = 100
    direction                 = "Inbound"
    access                    = "Allow"
    protocol                  = "Tcp"
    source_port_range         = "*"
    destination_port_range    = "443"
    source_address_prefix     = "*"
    destination_address_prefix = "*"
  }
]
tags = {
  "Environment" = "Production"
  "Project"     = "NSGProject"
}
