# Azure Virtual Network Terraform Module

This is a reusable Terraform module for creating an Azure Virtual Network (VNet) with a subnet.

## Steps to configure and use

### 1. Install Terraform
Ensure that Terraform is installed on your machine. You can download it from [here](https://www.terraform.io/downloads.html).

### 2. Configure your Azure Provider
You need to authenticate to Azure before you can deploy resources. Set up authentication using one of the following options:

- [Azure CLI authentication](https://www.terraform.io/docs/providers/azurerm/auth/docs.html#azure-cli)
- [Service Principal authentication](https://www.terraform.io/docs/providers/azurerm/auth/docs.html#service-principal)

### 3. Configure your Variables

Create a `terraform.tfvars` file or specify variables in `example.tf` for the following:

```hcl
vnet_name             = "myVNet"
location             = "East US"
resource_group_name  = "myResourceGroup"
address_space        = ["10.0.0.0/16"]
subnet_name          = "mySubnet"
subnet_address_prefixes = ["10.0.1.0/24"]
tags                 = {
  "Environment" = "Development"
}

4. Initialize Terraform

Run the following command to initialize your working directory:

terraform init

5. Apply the Configuration

Once initialized, you can apply the configuration to create the resources in Azure:

terraform apply

6. Verify the Results

After running the terraform apply, you should see the output IDs for the VNet and subnet. You can view
hese outputs by running:

terraform output
