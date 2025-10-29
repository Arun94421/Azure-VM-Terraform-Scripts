# Azure Windows Virtual Machine Provisioning with Terraform

## Overview

This Terraform configuration script provisions a Windows Virtual Machine (VM) on Microsoft Azure along with the required networking resources such as a Resource Group, Public IP Address, Network Interface (NIC), Network Security Group (NSG), and a virtual machine with associated settings. The script utilizes the `azurerm` provider to manage Azure resources.

### Components

1. **Resource Group** - The container for all Azure resources.
2. **Public IP Address** - A static public IP assigned to the VM for external access.
3. **Network Interface** - The virtual network adapter attached to the VM.
4. **Network Security Group** - Defines the firewall rules for the VM.
5. **Windows Virtual Machine** - The actual compute resource with a specific OS image, size, and admin credentials.

## Requirements

* **Terraform Version**: >= 1.5.0
* **Azure Provider**: `azurerm` version >= 4.0

### Providers

The configuration uses the `azurerm` provider to interact with Azure resources. The provider is configured to support the required version:

```hcl
provider "azurerm" {
  features {}
}
```

### Terraform Block

```hcl
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
```

This block specifies the Terraform version and the required version of the Azure provider (`azurerm`).

## Resources

### 1. **Resource Group**

This resource creates an Azure Resource Group where all the subsequent resources (VM, IP, NIC, etc.) will be deployed.

```hcl
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
```

### 2. **Public IP Address**

A public IP address is created and associated with the VM to allow external access.

```hcl
resource "azurerm_public_ip" "vm_pip" {
  name                = var.vm_pip
  resource_group_name = var.rg_Name
  location            = var.location
  allocation_method   = var.pip_allocation
}
```

### 3. **Network Interface (NIC)**

A network interface is created and linked to the public IP and subnet. The NIC connects the VM to the virtual network.

```hcl
resource "azurerm_network_interface" "vm_nic" {
  name                = var.vm_nic
  resource_group_name = var.rg_Name
  location            = var.location

  ip_configuration {
    name                          = var.ip_configuration
    subnet_id                     = var.vm_subnetid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pip.id
  }
}
```

### 4. **Network Security Group (NSG)**

The NSG defines inbound rules for the VM. In this case, it allows inbound traffic on port 443 (HTTPS) for secure communication.

```hcl
resource "azurerm_network_security_group" "webserver" {
  name                = "tls_webserver"
  location            = var.location
  resource_group_name = var.rg_Name
  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "tls"
    priority                   = 100
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "443"
    destination_address_prefix = azurerm_network_interface.vm_nic.private_ip_address
  }
}
```

### 5. **Network Interface Security Group Association**

This resource associates the NIC with the Network Security Group to apply the firewall rules.

```hcl
resource "azurerm_network_interface_security_group_association" "main" {
  network_interface_id      = azurerm_network_interface.vm_nic.id
  network_security_group_id = azurerm_network_security_group.webserver.id
}
```

### 6. **Windows Virtual Machine (VM)**

This resource creates a Windows VM and links it to the previously created NIC and associated NSG. The VM is configured with various settings such as OS disk type, size, admin credentials, and image source.

```hcl
resource "azurerm_windows_virtual_machine" "winvm" {
  name                = var.vm_name
  resource_group_name = var.rg_Name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.vm_username
  admin_password      = var.vm_password

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  os_disk {
    storage_account_type = var.vm_os_disk_strg_type
    caching              = var.vm_os_disk_caching
  }
}
```

## Variables

The following variables must be defined to customize the script:

```hcl
variable "resource_group_name" {}
variable "location" {}
variable "vm_pip" {}
variable "rg_Name" {}
variable "pip_allocation" {}
variable "vm_nic" {}
variable "ip_configuration" {}
variable "vm_subnetid" {}
variable "vm_name" {}
variable "vm_size" {}
variable "vm_username" {}
variable "vm_password" {}
variable "vm_image_publisher" {}
variable "vm_image_offer" {}
variable "vm_image_sku" {}
variable "vm_image_version" {}
variable "vm_os_disk_strg_type" {}
variable "vm_os_disk_caching" {}
```

### Example `terraform.tfvars`

You can define the variable values in a `terraform.tfvars` file:

```hcl
resource_group_name = "myResourceGroup"
location            = "East US"
vm_pip              = "myPublicIP"
rg_Name             = "myResourceGroup"
pip_allocation      = "Static"
vm_nic              = "myNIC"
ip_configuration    = "myIPConfig"
vm_subnetid         = "/subscriptions/.../subnets/mySubnet"
vm_name             = "myVM"
vm_size             = "Standard_DS2_v2"
vm_username         = "adminuser"
vm_password         = "SecurePassword123!"
vm_image_publisher  = "MicrosoftWindowsServer"
vm_image_offer      = "WindowsServer"
vm_image_sku        = "2019-Datacenter"
vm_image_version    = "latest"
vm_os_disk_strg_type = "Standard_LRS"
vm_os_disk_caching  = "ReadWrite"
```

## Usage

### Steps to Deploy

1. **Initialize Terraform**: Run the following command to initialize the working directory and download the necessary providers.

   ```bash
   terraform init
   ```

2. **Review the Plan**: Generate an execution plan to see the changes Terraform will make.

   ```bash
   terraform plan
   ```

3. **Apply the Configuration**: Apply the configuration to provision the resources in Azure.

   ```bash
   terraform apply
   ```

4. **Destroy the Resources**: If you no longer need the resources, you can destroy them by running:

   ```bash
   terraform destroy
   ```

Let me know if you need any further customizations or if you have any additional questions!

