This file contains documentation on how to set up and use the configuration.

# Terraform Configuration: Azure Virtual Network with Subnets

This Terraform configuration will create an **Azure Virtual Network (VNet)** along with multiple **subnets**. It uses variables for configuration, allowing you to easily modify the values based on your requirements.

## Prerequisites

- **Terraform** installed on your local machine
- An **Azure account** with appropriate permissions to create resources
- **Azure CLI** authenticated (`az login`)

### Steps to Use

1. **Clone the repository or copy the configuration**: Place the `main.tf`, `variables.tf`, `outputs.tf`, `terraform.tfvars`, and `README.md` files in your working directory.

2. **Configure your `terraform.tfvars`**: Open the `terraform.tfvars` file and fill in the appropriate values for the following:
   - `vnet_name`: The name of your virtual network.
   - `location`: The Azure region where you want to deploy the resources.
   - `resource_group_name`: The Azure resource group in which to deploy the resources.
   - `vnet_address_space`: The address space for the virtual network.
   - `subnets`: A map of subnet names, address prefixes, and optional NSG IDs.
   - `tags`: Tags to apply to your resources.

3. **Initialize Terraform**: Run `terraform init` in your terminal to initialize the Terraform configuration.

4. **Plan the Deployment**: Run `terraform plan` to see what Terraform will create.

5. **Apply the Configuration**: Run `terraform apply` to create the resources.

6. **Check Outputs**: After the apply process is complete, Terraform will output the VNet ID and the IDs and names of the subnets.

### Example:

```hcl
vnet_name            = "my-vnet"
location            = "East US"
resource_group_name = "my-resource-group"
vnet_address_space   = ["10.0.0.0/16"]

subnets = {
  "subnet-frontend" = {
    name            = "subnet-frontend"
    address_prefixes = ["10.0.1.0/24"]
    nsg_id          = ""  # Optional: Replace with NSG ID if needed
  },
  "subnet-backend" = {
    name            = "subnet-backend"
    address_prefixes = ["10.0.2.0/24"]
    nsg_id          = ""  # Optional: Replace with NSG ID if needed
  }
}

tags = {
  environment = "development"
  project     = "vnet-setup"
}

Outputs

After running terraform apply, you will get the following outputs:

vnet_id: The ID of the created Virtual Network.

subnet_ids: The IDs of the created subnets.

subnet_names: The names of the created subnets.
