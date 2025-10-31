# Provider Configuration for Azure Active Directory
provider "azuread" {
  version = "~> 2.0"
}

# Resource: Create Azure AD User
resource "azuread_user" "example_user" {
  user_principal_name = var.user_principal_name
  display_name        = var.user_display_name
  mail_nickname       = var.user_mail_nickname
  password            = var.user_password
}

# Resource: Create Azure AD Group
resource "azuread_group" "example_group" {
  display_name = var.group_display_name
  security_enabled = true
}

# Resource: Assign Role to User
resource "azuread_group_member" "example_group_member" {
  group_object_id = azuread_group.example_group.id
  member_object_id = azuread_user.example_user.id
}
