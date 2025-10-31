output "user_id" {
  description = "The ID of the created user"
  value       = azuread_user.example_user.id
}

output "group_id" {
  description = "The ID of the created group"
  value       = azuread_group.example_group.id
}

output "role_assignment" {
  description = "Role assignment details"
  value       = azuread_group_member.example_group_member.id
}
