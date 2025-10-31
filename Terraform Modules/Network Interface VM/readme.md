# Azure Network Interface (NIC) Terraform Setup

This repository contains a Terraform configuration for creating a Network Interface (NIC) in Azure. It is a reusable setup using variables, ensuring flexibility and ease of use.

## Prerequisites

Before you begin, ensure the following:

1. **Azure CLI**: Install the Azure CLI to interact with Azure resources.
   - [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

2. **Terraform**: Install Terraform for provisioning the infrastructure.
   - [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Setup Instructions

### 1. **Login to Azure CLI**

Authenticate with your Azure account using:

```bash
az login
Set the active subscription if needed:

bash
Copy code
az account set --subscription "your-subscription-id"

2. Clone the Repository
Clone or download this repository to your local machine:

bash
Copy code
git clone https://github.com/your-repo/azure-vm-network-interface.git
cd azure-vm-network-interface

3. Configure the terraform.tfvars File
Modify the terraform.tfvars file to specify your desired values for the NIC, location, resource group, subnet, etc.

Example:

hcl
Copy code
nic_name             = "my-nic"
location            = "East US"
resource_group_name = "my-resource-group"
ip_configuration_name = "my-ip-config"
subnet_id           = "/subscriptions/your-subscription-id/resourceGroups/my-resource-group/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/my-subnet"

4. Initialize Terraform
Initialize the Terraform configuration:

bash
Copy code
terraform init

5. Validate the Configuration
Ensure your configuration is correct:

bash
Copy code
terraform validate

6. Plan the Deployment
Preview the changes Terraform will apply:

bash
Copy code
terraform plan

7. Apply the Configuration
Apply the configuration to create the Network Interface:

bash
Copy code
terraform apply
Confirm the changes by typing yes when prompted.

8. Check Outputs
After the deployment, Terraform will output the NIC ID and private IP address:

bash
Copy code
nic_id
nic_private_ip
