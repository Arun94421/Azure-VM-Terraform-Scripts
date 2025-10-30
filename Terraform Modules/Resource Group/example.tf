# example.tf

# Call the module to create an Azure Resource Group
module "resource_group" {
  source              = "./modules/resource_group"  # Path to the module
  resource_group_name = "my-example-resource-group" # Pass the name of the RG
  location            = "East US"                   # Pass the location
  tags                = {
    "Environment" = "Development"
    "Project"     = "TerraformExample"
  }
}

# Output the results from the module
output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "resource_group_location" {
  value = module.resource_group.resource_group_location
}

output "resource_group_id" {
  value = module.resource_group.resource_group_id
}
