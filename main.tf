terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# ------------------------------------------------------------
# Resource Group
# ------------------------------------------------------------
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# ------------------------------------------------------------
# Virtual Network
# ------------------------------------------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# ------------------------------------------------------------
# Public Subnet
# ------------------------------------------------------------
resource "azurerm_subnet" "public" {
  name                 = var.public_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.public_subnet_prefix
}

# ------------------------------------------------------------
# Private Subnet
# ------------------------------------------------------------
resource "azurerm_subnet" "private" {
  name                 = var.private_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.private_subnet_prefix
}

# ------------------------------------------------------------
# Network Security Group (Private Subnet)
# ------------------------------------------------------------
resource "azurerm_network_security_group" "private_nsg" {
  name                = "${var.private_subnet_name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowAzureLoadBalancerInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "AzureLoadBalancer"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowInternalVNet"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
    source_port_range          = "*"
    destination_port_range     = "*"
  }
}

# Associate NSG
resource "azurerm_subnet_network_security_group_association" "private_assoc" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.private_nsg.id
}

# ------------------------------------------------------------
# Key Vault Access - Fetch Admin Username & SSH Key
# ------------------------------------------------------------

data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg_name
}

# Admin username secret
data "azurerm_key_vault_secret" "admin_username" {
  name         = var.key_vault_admin_username_secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

# SSH public key secret (or password if using password auth)
data "azurerm_key_vault_secret" "ssh_public_key" {
  name         = var.key_vault_ssh_key_secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

# ------------------------------------------------------------
# Network Interface for VM
# ------------------------------------------------------------
resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.private.id
    private_ip_address_allocation = "Dynamic"
  }
}

# ------------------------------------------------------------
# Virtual Machine in Private Subnet
# ------------------------------------------------------------
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_size
  admin_username      = data.azurerm_key_vault_secret.admin_username.value

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id
  ]

  admin_ssh_key {
    username   = data.azurerm_key_vault_secret.admin_username.value
    public_key = data.azurerm_key_vault_secret.ssh_public_key.value
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = var.tags
}
