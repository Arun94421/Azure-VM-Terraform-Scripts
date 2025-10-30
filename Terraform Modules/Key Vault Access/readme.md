# Azure Key Vault Setup using Terraform

## Introduction

This repository provides a Terraform configuration for creating an **Azure Key Vault**. The key vault stores **secrets** such as an **admin username** and **SSH key**. The module is designed to be reusable and configurable, utilizing **Terraform variables** for all settings, ensuring that it can be customized for different environments without hardcoded values.

By running this configuration, you can automate the process of securely storing secrets in Azure Key Vault, which can be accessed later by other applications or services requiring these credentials.

This module is useful for any environment where sensitive data, such as usernames or SSH keys, needs to be securely stored and managed within Azure.

## Prerequisites

Before you start, make sure you have the following prerequisites installed:

1. **Terraform** (v1.5.0 or higher)
   - [Terraform Downloads](https://www.terraform.io/downloads.html)

2. **Azure CLI** (for authentication)
   - [Azure CLI Installation Guide](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

3. **Authentication via Azure CLI**  
   To authenticate with Azure using the CLI, run:
   ```bash
   az login
   
Setup and Configuration

Step 1: Clone the Repository
Clone the repository to your local machine:

bash
Copy code
git clone <repository_url>
cd terraform-keyvault

Step 2: Azure Authentication
Ensure you're authenticated with Azure via the Azure CLI. If you're not already logged in, execute:

bash
Copy code
az login
This command will open a browser window for you to log into your Azure account.

Step 3: Initialize Terraform
To initialize your Terraform working directory and download the required provider plugins, run:

bash
Copy code
terraform init
This will set up the environment for Terraform and install the necessary Azure provider.

Step 4: Configure Variables
The module requires several variables to function properly. These variables can be configured in the terraform.tfvars file.

Example terraform.tfvars file:

hcl
Copy code
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
Make sure to replace the placeholder values (<your-tenant-id> and <your-ssh-public-key>) with your actual Azure Tenant ID and SSH public key.

Step 5: Apply the Configuration
To apply the Terraform configuration and create the Azure resources, run the following:

bash
Copy code
terraform apply
Terraform will show an execution plan, and you will need to confirm by typing yes to proceed.

Step 6: Verify Resources
Once the Terraform apply command completes successfully, the Azure Key Vault and stored secrets (admin username and SSH key) will be created in your Azure environment.

You can verify this by using the Azure CLI:

bash
Copy code
az keyvault show --name myKeyVault --resource-group myResourceGroup
Alternatively, you can log into the Azure Portal and check the Key Vault resources.

Variables
The following input variables are used to configure the Key Vault module:

Variable	Description	Type	Default Value
key_vault_name	The name of the Key Vault.	string	None
resource_group_name	The name of the Resource Group.	string	None
location	The Azure region where the Key Vault will be created.	string	None
tenant_id	The Tenant ID for Azure Active Directory.	string	None
admin_username	Admin username to be stored in the Key Vault.	string	None
ssh_key	The SSH key to be stored in the Key Vault.	string	None
tags	Tags to be applied to the Key Vault.	map(string)	{}

Outputs
The module provides the following outputs:

Output	Description
admin_username	The admin username stored in Key Vault
ssh_key	The SSH key stored in Key Vault

Example output after running terraform apply:

bash
Copy code
Outputs:

admin_username = "adminUser"
ssh_key = "<your-ssh-public-key>"
