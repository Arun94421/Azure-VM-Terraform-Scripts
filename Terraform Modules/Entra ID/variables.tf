# Variables for User Creation
variable "user_principal_name" {
  description = "The User Principal Name (UPN) for the new user"
  type        = string
}

variable "user_display_name" {
  description = "The display name of the new user"
  type        = string
}

variable "user_mail_nickname" {
  description = "The mail nickname for the new user"
  type        = string
}

variable "user_password" {
  description = "Password for the new user"
  type        = string
}

# Variables for Group Creation
variable "group_display_name" {
  description = "The display name of the group"
  type        = string
}
