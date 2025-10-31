This file provides detailed instructions on setting up and configuring the environment. It explains the workflow for initializing, applying, and destroying the resources.

# Microsoft Entra ID (Azure AD) Setup using Terraform

This Terraform configuration sets up **Microsoft Entra ID** (formerly known as Azure Active Directory) by creating a **User**, **Group**, and assigning roles.

## Prerequisites

Before using this configuration, make sure you have the following set up:

- **Terraform** installed. [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).
- **Azure CLI** installed and logged in. [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
- **Azure Active Directory** access with sufficient permissions to create users, groups, and role assignments.

## Files Overview

- `main.tf`: Contains the resource configuration to create users, groups, and assign roles.
- `variables.tf`: Defines the input variables.
- `terraform.tfvars`: Contains the actual values for the variables (this is where you specify user and group details).
- `outputs.tf`: Contains outputs, such as the created user and group IDs.
- `example.tf`: A sample file to call the Terraform module for creating users and groups.

## Setting Up the Environment

### 1. Clone or Download the Repository

Clone or download this repository to your local machine.

```bash
git clone <repository-url>
cd <repository-folder>

2. Configure terraform.tfvars

Edit the terraform.tfvars file with appropriate values for your Azure environment:

user_principal_name   = "exampleuser@yourdomain.com"
user_display_name     = "Example User"
user_mail_nickname    = "exampleuser"
user_password         = "YourPasswordHere"
group_display_name    = "ExampleGroup"

3. Initialize Terraform

Run the following command to initialize the working directory:

terraform init

4. Validate the Configuration

You can validate your configuration before applying it to ensure there are no errors:

terraform validate

5. Apply the Configuration

Run terraform apply to create the resources. Terraform will show the plan and ask for confirmation before applying the changes:

terraform apply


Type yes when prompted to approve the changes.

6. Check the Outputs

Once the resources are created, Terraform will output the following details:

user_id: The ID of the newly created user.

group_id: The ID of the newly created group.

role_assignment: The role assignment details for the user.

Example output:

user_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
group_id      = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
role_assignment = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
