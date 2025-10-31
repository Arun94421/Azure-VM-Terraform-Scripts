# Variable for Active Directory name
variable "ad_name" {
  description = "Name of the Active Directory"
  type        = string
}

# Variable for Azure location
variable "location" {
  description = "Azure location for deployment"
  type        = string
}

# Variable for Resource Group Name
variable "resource_group_name" {
  description = "Resource group name for deployment"
  type        = string
}

# Variable for Service Principal display name
variable "sp_display_name" {
  description = "Display name for the Service Principal"
  type        = string
}

# Variable for Application ID
variable "app_id" {
  description = "App ID for the Service Principal"
  type        = string
}

# Variable for Role Definition (e.g., Contributor, Reader)
variable "role_definition_name" {
  description = "Role definition name for the Service Principal"
  type        = string
}

# Variable for Role Assignment scope
variable "scope" {
  description = "Scope for the role assignment"
  type        = string
}
