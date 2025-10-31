# Resource: Role Assignment (IAM Role)
resource "azurerm_role_assignment" "example" {
  principal_id   = var.principal_id          # The service principal/user to which the role is assigned
  role_definition_name = var.role_definition_name  # Role name (e.g., "Contributor", "Reader", "Owner")
  scope           = var.scope                 # Scope (e.g., subscription, resource group, or resource ID)
}

