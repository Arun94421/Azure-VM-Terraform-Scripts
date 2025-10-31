# Azure Blob Storage Setup with Terraform

This repository provides a Terraform configuration to create an **Azure Blob Storage** account and a container. The configuration is highly configurable, with all necessary values stored in variables to ensure the infrastructure is reusable, modular, and easily customizable. 

This setup is designed to deploy a resource group, a storage account, and a blob container in **Azure** with no hardcoded values. Instead, it uses Terraform variables, so you can easily modify it based on your specific requirements.

## Prerequisites

Before you begin, make sure you have the following installed:

## Setup Instructions

Step 1: Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/azure-blob-storage-terraform.git
cd azure-blob-storage-terraform

Step 2: Modify the terraform.tfvars File
Open the terraform.tfvars file and modify the values according to your requirements. Below are the key variables you can customize:

hcl
Copy code
resource_group_name        = "my-resource-group"
location                   = "East US"
storage_account_name       = "mystorageaccount"
account_tier               = "Standard"
account_replication_type  = "LRS"
container_name            = "mycontainer"
container_access_type     = "private"
tags = {
  environment = "production"
  project     = "blob-storage"
}

Step 3: Initialize Terraform
Run the following command to initialize Terraform and download the necessary providers:

bash
Copy code
terraform init

Step 4: Review the Plan
Before applying any changes, it's good practice to review what Terraform plans to do. Use the following command to generate the execution plan:

bash
Copy code
terraform plan
This will show you which resources will be created, modified, or destroyed.

Step 5: Apply the Configuration
Run the following command to apply the configuration. Terraform will create the resources in your Azure account as per the defined configuration:

bash
Copy code
terraform apply
Terraform will prompt for confirmation, type yes to proceed.
