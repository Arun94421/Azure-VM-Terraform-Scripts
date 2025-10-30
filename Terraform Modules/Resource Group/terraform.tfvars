# terraform.tfvars

# Override the variables if needed
resource_group_name = "my-custom-resource-group"
location            = "West US"
tags = {
  "Environment" = "Production"
  "Project"     = "AzureDeployment"
}
