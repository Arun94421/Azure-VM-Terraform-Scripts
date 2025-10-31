# README.tf - Instructions for using the Azure Storage Account Terraform Module

## Introduction

This Terraform module provisions an **Azure Storage Account** in a specified **Azure region** with configurable parameters like resource group name, location, storage account name, performance tier, and replication strategy. It is designed to be a reusable, modular component that can easily be integrated into larger infrastructure automation workflows.

## Prerequisites

Before using this module, make sure the following prerequisites are met:

1. **Install Terraform**:
   - Terraform is an open-source tool used for automating cloud infrastructure. You can install Terraform by following the official guide:
     - [Terraform Installation Guide](https://www.terraform.io/downloads.html)

2. **Install Azure CLI**:
   - Azure CLI is used to interact with Azure resources from the command line. Install Azure CLI by following the guide:
     - [Azure CLI Installation Guide](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

3. **Authenticate with Azure**:
   - Use Azure CLI to authenticate your session:
     ```bash
     az login
     ```

## Steps to Use This Module

### 1. Clone or Copy the Module

Clone or copy the entire Terraform module directory into your working directory.

```bash
git clone https://your-repository-url/azure-storage-account-module.git

2. Create a main.tf File
In your working directory, create a main.tf file to reference the module.

Example main.tf:

hcl
Copy code
provider "azurerm" {
  features {}
}

module "azure_storage" {
  source                = "./path/to/azure_storage_account_module"
  resource_group_name   = "my-resource-group"
  location              = "East US"
  storage_account_name  = "examplestorageacct"
}
Make sure to replace ./path/to/azure_storage_account_module with the actual path to the module.

3. Set the Variable Values
You can set the variable values either in the main.tf file directly or by creating a terraform.tfvars file in the same directory. For example, create a terraform.tfvars file as follows:

hcl
Copy code
resource_group_name = "my-example-resource-group"
location            = "East US"
storage_account_name = "examplestorageacct123"
account_tier         = "Standard"
account_replication_type = "LRS"
Note: Ensure that the storage_account_name is globally unique. It should be between 3 and 24 characters and only consist of lowercase letters and numbers.

4. Initialize Terraform
Initialize Terraform in your working directory. This step will download the necessary provider plugins and set up the working environment.

bash
Copy code
terraform init

5. Plan the Changes
Before applying the changes, run the terraform plan command to preview the infrastructure Terraform will create.

bash
Copy code
terraform plan
This command will show you what Terraform is going to create, modify, or destroy.

6. Apply the Changes
Run terraform apply to apply the changes and provision the resources.

bash
Copy code
terraform apply
You will be prompted to confirm that you want to proceed with the changes. Type yes to allow Terraform to create the resources.
