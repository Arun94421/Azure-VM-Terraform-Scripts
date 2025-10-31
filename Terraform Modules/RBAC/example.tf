module "iam_role_assignment" {
  source               = "./"  # Path to your Terraform configuration
  principal_id         = "your-principal-id"
  role_definition_name = "Contributor"
  scope                = "/subscriptions/your-subscription-id"
}
