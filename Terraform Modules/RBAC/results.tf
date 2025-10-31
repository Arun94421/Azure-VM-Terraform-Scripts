output "role_assignment_id" {
  description = "The ID of the role assignment"
  value       = azurerm_role_assignment.example.id
}

output "role_assignment_principal_id" {
  description = "The principal ID of the role assignment"
  value       = azurerm_role_assignment.example.principal_id
}

output "role_assignment_role_name" {
  description = "The name of the role assigned"
  value       = azurerm_role_assignment.example.role_definition_name
}

output "role_assignment_scope" {
  description = "The scope of the role assignment"
  value       = azurerm_role_assignment.example.scope
}
