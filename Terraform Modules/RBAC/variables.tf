variable "principal_id" {
  description = "The ID of the principal (user or service principal) to assign the role"
  type        = string
}

variable "role_definition_name" {
  description = "The name of the role to assign (e.g., Contributor, Owner)"
  type        = string
}

variable "scope" {
  description = "The scope of the role assignment (e.g., subscription, resource group, or resource ID)"
  type        = string
}

