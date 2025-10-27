module "azure_vnet_vm" {
  source = "./"

  # Resource Group & Location
  resource_group_name = "rg-demo"
  location            = "East US"

  # Virtual Network Configuration
  vnet_name             = "demo-vnet"
  vnet_address_space    = ["10.0.0.0/16"]
  public_subnet_name    = "public-subnet"
  public_subnet_prefix  = ["10.0.1.0/24"]
  private_subnet_name   = "private-subnet"
  private_subnet_prefix = ["10.0.2.0/24"]

  # VM Configuration
  vm_name               = "private-vm"
  vm_size               = "Standard_B1s"

  # Key Vault Integration - Fetch Secrets for VM Login
  key_vault_name                      = "my-keyvault"
  key_vault_rg_name                   = "rg-security"
  key_vault_admin_username_secret_name = "vm-admin-username"
  key_vault_ssh_key_secret_name        = "vm-ssh-public-key"

  # VM Image Configuration
  vm_image = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  # Tags (Optional)
  tags = {
    environment = "dev"
    project     = "keyvault-secure-vm"
  }
}

