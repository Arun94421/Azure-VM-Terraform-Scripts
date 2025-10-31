# Azure Storage Queue Setup with Terraform

## Introduction

This Terraform module creates the necessary resources to deploy an **Azure Storage Queue** in your Azure environment. The module automatically provisions a **Resource Group**, a **Storage Account**, and a **Storage Queue** based on customizable variables, making it highly flexible for different environments. 

By using this module, you can automate the creation of Storage Queues in Azure, and because all values are parameterized using Terraform variables, you can easily modify the configuration without the need for hardcoding values. This allows for easy reuse and scalability.

## Usage Instructions

Step 1: Clone the Repository

Start by cloning this repository to your local machine:

```bash
git clone https://github.com/yourusername/azure-storage-queue-terraform.git
cd azure-storage-queue-terraform

Step 2: Configure the terraform.tfvars File
Open the terraform.tfvars file and modify the variable values according to your requirements. The values you need to modify include:

resource_group_name: The name of the resource group.

location: The Azure region where the resources will be deployed.

storage_account_name: The name of the storage account.

queue_name: The name of the queue to be created.

queue_metadata: Optional metadata to associate with the queue.

Here is an example terraform.tfvars configuration:

h
Copy code
# terraform.tfvars

resource_group_name        = "my-resource-group"
location                   = "East US"
storage_account_name       = "examplestorageacct"
account_tier               = "Standard"
account_replication_type  = "LRS"
queue_name                 = "myqueue"
queue_metadata = {
  environment = "production"
  app         = "queue-app"
}
tags = {
  environment = "production"
  project     = "azure-queue"
}

Step 3: Initialize Terraform
Initialize your Terraform working directory by running the following command:

bash
Copy code
terraform init
This will download the necessary providers and initialize the backend.

Step 4: Review the Execution Plan
Before applying the configuration, review the execution plan to see what changes Terraform will make:

bash
Copy code
terraform plan
This will display a preview of the actions Terraform will take, such as creating the resource group, storage account, and storage queue.

Step 5: Apply the Configuration
Run the following command to apply the configuration:

bash
Copy code
terraform apply
Terraform will ask for confirmation. Type yes to proceed.
