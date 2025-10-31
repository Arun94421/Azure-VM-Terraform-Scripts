Azure Active Directory Terraform Setup

It contains a Terraform configuration to provision an Azure Active Directory (AD), along with a Service Principal and Role Assignment. This setup will allow you to automate the creation and management of these resources in Azure using Terraform.

Introduction

Azure Active Directory (Azure AD) is a cloud-based identity and access management service. With this Terraform configuration, you can:

* Create an Azure AD.

* Set up a Service Principal.

* Assign roles to the Service Principal in a specified scope.

Prerequisites

Before you begin, you must ensure that you have the following prerequisites:

Azure CLI installed: The Azure CLI is a command-line tool that lets you manage Azure resources from your local machine or automated scripts.

Terraform installed: You will need Terraform to manage and deploy your Azure resources.

Azure Account: You need an Azure account to interact with the Azure resources.

Setting Up the Environment Using Azure CLI
1. Login to Azure CLI

First, log in to your Azure account using the Azure CLI. Open your terminal and run the following command:

az login


This will open a browser window where you can authenticate using your Azure credentials.

If you have multiple subscriptions, you can set the active subscription like this:

az account set --subscription "your-subscription-id"

2. Set Up Azure Active Directory Permissions

Ensure that you have the required permissions to create and manage resources like Azure Active Directory, Service Principals, and Role Assignments in your subscription.

You can check if you have the correct permissions by running:

az role assignment list --assignee <your-azure-user-id>

Make sure your account has the necessary permissions, such as:

Global Administrator or Owner permissions for creating Active Directory.

Contributor or higher role for managing resources.

3. Download or Clone the Repository

Next, clone or download the repository to your local machine:

git clone https://github.com/your-repo/azure-ad-terraform.git
cd azure-ad-terraform

4. Configure the terraform.tfvars File

Inside the cloned repository, you'll find the terraform.tfvars file. This is where you define the values for the variables in the Terraform configuration.

You can edit terraform.tfvars and set the following values:

ad_name             = "my-azure-ad"
location           = "East US"
resource_group_name = "my-resource-group"
sp_display_name     = "my-service-principal"
app_id             = "your-app-id"  # Your application ID
role_definition_name = "Contributor"  # Role like Owner, Contributor, Reader
scope              = "/subscriptions/your-subscription-id"

5. Initialize Terraform

Now, initialize Terraform. This will download the necessary provider plugins and prepare the environment for applying the configurations:

terraform init

6. Validate the Configuration

Once the initialization is complete, it's always a good idea to validate the configuration to check for any errors in the Terraform code:

terraform validate


If everything is valid, you should see the following message:

Success! The configuration is valid.

7. Run Terraform Plan

Before applying the changes, you can run a Terraform plan to preview what changes will be made to your Azure resources:

terraform plan


This will show you a summary of the actions Terraform will take, including creating resources like Active Directory, Service Principal, and Role Assignment.

8. Apply the Configuration

If the plan looks good, you can apply the configuration to create the resources in Azure:

terraform apply


Terraform will prompt you to confirm the actions. Type yes to proceed. Terraform will then create the resources and display the outputs, such as the Azure AD ID and Service Principal ID.

9. Check the Outputs

After the deployment is complete, Terraform will output the ad_id and service_principal_id, which you can use for further configurations or integrations.

Example output:

ad_id                = "some-id"
service_principal_id = "some-other-id"
