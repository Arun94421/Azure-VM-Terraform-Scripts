# terraform.tfvars

key_vault_name       = "myKeyVault"
resource_group_name  = "myResourceGroup"
location             = "East US"
tenant_id            = "<your-tenant-id>"
admin_username       = "adminUser"
ssh_key              = "<your-ssh-public-key>"
tags = {
  Environment = "Development"
  Project     = "TerraformKeyVault"
}
