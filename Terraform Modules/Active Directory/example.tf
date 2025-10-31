module "azure_ad" {
  source              = "./"
  ad_name             = "example-ad"
  location           = "East US"
  resource_group_name = "example-rg"
  sp_display_name     = "example-sp"
  app_id             = "your-app-id"   # Set this to your actual App ID
  role_definition_name = "Contributor" # or another role (e.g., Reader, Owner)
  scope              = "/subscriptions/your-subscription-id"
}
