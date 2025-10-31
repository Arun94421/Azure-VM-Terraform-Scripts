# Azure IAM Role Assignment using Terraform

This Terraform configuration helps you to assign an Azure IAM Role to a user or service principal. You can customize the role, scope, and principal ID as per your requirements.

## Prerequisites

Before using this configuration, ensure you have the following set up:

- **Azure CLI** installed and logged in.
- **Terraform** installed. [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).
- **Azure Subscription** where the role assignment will be done.

## File Structure

- `main.tf`: Contains the resource definition for Azure IAM Role assignment.
- `variables.tf`: Defines the variables for the role assignment.
- `outputs.tf`: Defines the outputs like role assignment ID, principal ID, etc.
- `terraform.tfvars`: Contains the values for variables (e.g., principal ID, role, and scope).
- `example.tf`: Example of how to use the module for creating a role assignment.

## Setting Up the Environment

### 1. Clone or Download the Repository

Clone the repository to your local machine.

```bash
git clone <repository-url>
cd <repository-folder>

2. Update terraform.tfvars
Edit the terraform.tfvars file and replace the placeholder values with your Azure details.

hcl
Copy code
principal_id          = "your-principal-id"  # The ID of the service principal or user
role_definition_name  = "Contributor"        # Role name like Owner, Contributor, Reader
scope                 = "/subscriptions/your-subscription-id"  # Subscription, resource group, or resource ID

3. Initialize Terraform
Run the following command to initialize the Terraform working directory:

bash
Copy code
terraform init

4. Validate the Configuration
Run terraform validate to check if your configuration is correct:

bash
Copy code
terraform validate

5. Apply the Configuration
Now, run terraform apply to assign the role to the principal. Terraform will ask for confirmation before proceeding:

bash
Copy code
terraform apply
Type yes when prompted to confirm the changes.

6. View the Outputs
After the role assignment is applied, Terraform will show outputs like the role assignment ID, principal ID, role name, and scope in the terminal.

Example output:

bash
Copy code
role_assignment_id       = "/subscriptions/your-subscription-id/providers/Microsoft.Authorization/roleAssignments/your-role-assignment-id"
role_assignment_principal_id = "your-principal-id"
role_assignment_role_name  = "Contributor"
role_assignment_scope       = "/subscriptions/your-subscription-id"
