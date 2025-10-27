# Azure Terraform Module - VM creation using Vnet & Subnets

## Overview
This Terraform module creates:
- One Resource Group  
- One Virtual Network  
- One Public Subnet and One Private Subnet  
- NSG for private subnet  
- A Linux VM inside the private subnet  

##  Prerequisites
- Install [Terraform](https://developer.hashicorp.com/terraform/downloads)
- Install [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)
- Run `az login` to authenticate your Azure account
- Ensure you have an SSH public key locally (e.g., `~/.ssh/id_rsa.pub`)

## Steps to Deploy
1. Clone this repository:
   ```bash
   git clone <repo_url>
   cd azure-vnet-vm-module
# Azure-VM-Terraform-Scripts

2. Initialize Terrafofrm:
      terraform init
   
3. Validate Configuration:
      terraform validate

4. Plan the deployment:
      terraform plan
   
5. Apply the configuration
      terraform apply

6. View outputs:
      terraform output
  
7. Destroy resources:
      terraform destroy

       
