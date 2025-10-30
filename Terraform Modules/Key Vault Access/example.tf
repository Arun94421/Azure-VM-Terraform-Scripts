# example.tf

# Module Call for Key Vault Setup
module "key_vault" {
  source = "./"  # Path to the current module directory

  key_vault_name      = "myKeyVault"
  resource_group_name = "myResourceGroup"
  location            = "East US"
  tenant_id           = "<your-tenant-id>"
  admin_username      = "adminUser"
  ssh_key             = "<your-ssh-public-key>"

  tags = {
    Environment = "Development"
    Project     = "TerraformKeyVault"
  }
}

# Outputs
output "admin_username" {
  value = module.key_vault.admin_username
}

output "ssh_key" {
  value = module.key_vault.ssh_key
}
