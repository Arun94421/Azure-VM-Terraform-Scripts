# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Azure Active Directory (AD)
resource "azurerm_active_directory" "example" {
  name                = var.ad_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Service Principal
resource "azurerm_service_principal" "example" {
  display_name = var.sp_display_name
  app_id       = var.app_id
}

# Role Assignment
resource "azurerm_role_assignment" "example" {
  principal_id         = azurerm_service_principal.example.id
  role_definition_name = var.role_definition_name
  scope                = var.scope
}

# Output the results for easy access
output "ad_id" {
  description = "The ID of the Active Directory"
  value       = azurerm_active_directory.example.id
}

output "service_principal_id" {
  description = "ID of the Service Principal"
  value       = azurerm_service_principal.example.id
}
