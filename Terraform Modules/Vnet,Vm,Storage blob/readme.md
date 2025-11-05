# Azure Terraform Infrastructure Project

## Project Structure

terraform-azure-infrastructure/
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── modules/
│   ├── vnet/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── vm/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── storage/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and configured
- An active Azure subscription

## Setup Instructions

### 1. Azure Authentication

Login to Azure CLI:
```bash
az login
az account set --subscription "<your-subscription-id>"
```

### 2. Initialize Terraform

```bash
cd terraform-azure-infrastructure
terraform init
```

### 3. Configure Variables

Copy the example variables file and customize it:
```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` with your desired values:
```hcl
resource_group_name = "my-rg"
location           = "eastus"
vnet_address_space = ["10.0.0.0/16"]
subnet_address_prefixes = ["10.0.1.0/24"]
vm_size            = "Standard_B2s"
admin_username     = "azureuser"
```

### 4. Plan and Apply

Review the planned changes:
```bash
terraform plan
```

Apply the configuration:
```bash
terraform apply
```

Type `yes` when prompted to confirm.

## Module Descriptions

### VNet Module
Creates an Azure Virtual Network with:
- Virtual Network with configurable address space
- Subnet with configurable address prefix
- Network Security Group with SSH/RDP rules

### VM Module
Creates an Azure Virtual Machine with:
- Linux Virtual Machine (Ubuntu 20.04 LTS)
- Network Interface with dynamic private IP
- Public IP address for external access
- OS disk with Standard_LRS storage
- SSH key authentication

### Storage Module
Creates Azure Storage resources:
- Storage Account with configurable replication
- Blob Container with private access
- Support for various storage tiers

## Customization

### Changing VM Operating System

Edit `modules/vm/main.tf` to change the OS image:
```hcl
source_image_reference {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-focal"
  sku       = "20_04-lts-gen2"
  version   = "latest"
}
```

### Adding More Subnets

Modify the `vnet` module to add additional subnets as needed.

### Storage Account Configuration

Adjust storage account properties in `modules/storage/variables.tf`:
- `account_tier`: Standard or Premium
- `account_replication_type`: LRS, GRS, RAGRS, ZRS

## Outputs

After successful deployment, Terraform will output:
- VNet ID and name
- VM public IP address and private IP
- Storage account name and blob container name

View outputs anytime:
```bash
terraform output
```

## Cleanup

To destroy all created resources:
```bash
terraform destroy
```

Type `yes` when prompted to confirm deletion.

## Security Considerations

1. **SSH Keys**: Never commit private SSH keys to version control
2. **Terraform State**: Store state file securely (consider using Azure Storage backend)
3. **Credentials**: Use Azure managed identities or service principals
4. **NSG Rules**: Review and restrict network security group rules as needed
5. **Storage Access**: Blob containers are created with private access by default
