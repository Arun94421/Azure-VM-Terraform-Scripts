module "azure_vnet_vm" {
  source = "./"

  resource_group_name  = "rg-name"
  location             = "East US"
  vnet_name            = "vnet-name"
  vnet_address_space   = "10.0.0.0/16"
  public_subnet_name   = "public-subnet"
  public_subnet_prefix = "10.0.1.0/24"
  private_subnet_name  = "private-subnet"
  private_subnet_prefix= "10.0.2.0/24"
  vm_name              = "vm-name"
  vm_size              = "Standard_B1s"
  admin_username       = "azureuser"
  ssh_public_key_path  = "~/.ssh/id_rsa.pub"
  allowed_ssh_source   = "PUBLIC_IP/32"
}
