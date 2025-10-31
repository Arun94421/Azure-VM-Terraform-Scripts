Azure Site Recovery with Terraform
Overview

This repository provides a Terraform configuration to deploy Azure Site Recovery (ASR) resources, including a Recovery Services Vault, Protection Containers, Protection Container Mappings, and a Recovery Plan for managing disaster recovery in Azure.

The Terraform configuration uses modular design, ensuring reusability and flexibility across different environments, with variables for customization and easy updates.

Resources Deployed:

* Recovery Services Vault

* Protection Containers

* Protection Container Mappings

* Recovery Plan (including failover strategy and items to protect)

This setup ensures seamless disaster recovery workflows and replication in Azure, with the flexibility to scale as per your business needs.

Steps to Deploy
1. Clone the Repository

Clone this repository to your local machine:

git clone https://github.com/yourusername/azure-site-recovery-terraform.git
cd azure-site-recovery-terraform

2. Configure Your Variables

Open and modify the terraform.tfvars file to customize the configuration to your environment:

# terraform.tfvars

recovery_vault_name        = "myRecoveryVault"
location                   = "East US"
resource_group_name        = "myResourceGroup"
container_name             = "myProtectionContainer"
fabric_name                = "myFabric"
container_mapping_name     = "myContainerMapping"

3. Initialize Terraform

Once your terraform.tfvars is configured, initialize your Terraform working directory:

terraform init


This will download the necessary provider plugins (in this case, the Azure provider).

4. Review the Plan

It's always a good idea to review what Terraform will do before applying changes. Run the following command to see a preview of the plan:

terraform plan


Terraform will show you which resources it will create, modify, or destroy.

5. Apply the Configuration

Apply the Terraform configuration to deploy your resources:

terraform apply


Type yes when prompted to confirm the action.

Terraform will proceed to create the resources, including the Recovery Vault, Protection Containers, Protection Container Mappings, and the Recovery Plan.
