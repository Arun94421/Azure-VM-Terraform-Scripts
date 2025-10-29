# Terraform Azure VNet and VM Setup with Key Vault Integration

This Terraform module sets up a **Virtual Network (VNet)** with both **public and private subnets**, a **Network Security Group (NSG)**, and a **Linux Virtual Machine (VM)** in the private subnet. 

This module integrates with **Azure Key Vault** to fetch sensitive values (like the admin username and SSH public key) securely during runtime.

## Module Overview

The module will create:
1. A **Resource Group**.
2. A **Virtual Network** with public and private subnets.
3. A **Network Security Group (NSG)** for the private subnet.
4. A **Linux Virtual Machine (VM)** in the private subnet.
5. The **VM's admin credentials** (username and SSH key) are retrieved securely from an **Azure Key Vault**.

## Usage

### Set up your Key Vault in Azure

1. **Create a Key Vault** (if not already created).
2. Add the following secrets to the Key Vault:
   - **`vm-admin-username`**: The admin username for the VM.
   - **`vm-ssh-public-key`**: The SSH public key used for authentication.

  
### Prerequisites

1. **Azure CLI**: You need to have the Azure CLI installed on your local machine for authentication purposes.

   * If you haven't installed it yet, follow the instructions [here](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
   * Use the command `az login` to authenticate to your Azure account. This step is necessary to allow Terraform to interact with your Azure subscription.

2. **Terraform**: Terraform is required to manage your infrastructure as code.

   * If you haven't installed Terraform, download and install it from [here](https://www.terraform.io/downloads).
   * The script specifies that Terraform version 1.5.0 or above is required (`terraform { required_version = ">= 1.5.0" }`).

---

### Workflow and Configuration

#### 1. **Setting Up Authentication with Azure CLI**

Before running any Terraform commands, you need to authenticate Terraform to interact with your Azure environment. This is done through the Azure CLI.

* **Step 1**: Open the command prompt or PowerShell and run:

  ```bash
  az login
  ```

  * This will open a browser window where you can sign in to your Azure account.
  * Once logged in, the Azure CLI will authenticate your session and allow Terraform to use this context.

* **Step 2**: Ensure you're working in the correct subscription (if you have multiple subscriptions). You can check your current subscription using:

  ```bash
  az account show
  ```

  * If you need to switch to a different subscription, use:

    ```bash
    az account set --subscription <your-subscription-id>
    ```

* **Step 3**: Verify that you are authenticated and that your subscription is set correctly.

#### 2. **Terraform Configuration**

The Terraform script defines various Azure resources such as a Resource Group, Virtual Network, Subnets, Network Security Groups (NSG), Key Vault, and a Virtual Machine. Below is a breakdown of what each resource does:

##### Resource Breakdown

* **Resource Group (`azurerm_resource_group`)**: This is the foundation for all other Azure resources. It contains all the resources you deploy and provides a management boundary.

  * **Name**: The name is defined by the variable `var.resource_group_name`.
  * **Location**: The location is defined by `var.location` and specifies the Azure region.

* **Virtual Network (`azurerm_virtual_network`)**: Defines the virtual network that connects resources within the resource group.

  * **Address Space**: The address space is specified by `var.vnet_address_space`.

* **Subnets**: The script defines two subnets: `public` and `private`. These subnets help organize the network structure for deploying VMs, load balancers, etc.

  * **Public Subnet**: Defined with the address prefix specified in `var.public_subnet_prefix`.
  * **Private Subnet**: Defined with the address prefix specified in `var.private_subnet_prefix`.

* **Network Security Group (NSG)**: This resource defines a set of security rules for the private subnet to control inbound and outbound traffic.

  * The rules allow Azure load balancer traffic and internal VNet traffic.

* **Key Vault**: The script fetches secrets (admin username and SSH key) from the Azure Key Vault.

  * These secrets are used to set up the virtual machine with SSH access.

* **Network Interface**: A network interface is created for the VM and attached to the private subnet.

* **Linux Virtual Machine**: A Linux VM is created in the private subnet, using the provided SSH key for access.

#### 3. **Subscription ID & Tenant Information**

In order to create resources within a specific subscription, you need the **Subscription ID**. This ID tells Terraform which Azure subscription to deploy resources into. If you don’t specify a subscription in your Terraform provider configuration, Terraform will use the default subscription from the Azure CLI session (`az login`).

* **Where is the Subscription ID?**
  You can find your Subscription ID by running:

  ```bash
  az account list --output table
  ```

  The output will list all your subscriptions with their associated IDs.

* **Creating Resources in a Subscription**:
  Once authenticated, you will be able to create a resource group (or any other resource) under the current subscription using the Terraform script. The resources will be created in the subscription you are currently logged into via the Azure CLI.

#### 4. **Terraform Initialization and Apply**

Once your authentication is set up and you have verified your subscription, you can run the following Terraform commands:

1. **Initialize Terraform**: Before applying any configurations, you need to initialize your Terraform working directory.

   ```bash
   terraform init
   ```

   * This command will download the necessary provider plugins (in this case, the Azure provider `azurerm`).

2. **Plan**: It’s always a good practice to run `terraform plan` to see the execution plan before actually applying any changes.

   ```bash
   terraform plan
   ```

3. **Apply**: If everything looks good in the plan, you can then apply the changes to your Azure subscription. This will create the resources as defined in your Terraform configuration.

   ```bash
   terraform apply
   ```

   * Confirm the action when prompted.

#### 5. **Variable Configuration**

In the provided Terraform script, several variables are used (e.g., `var.resource_group_name`, `var.location`, `var.vnet_name`). Need to define these variables either in a `.tfvars` file or directly in the command line when running Terraform.

Example:

```hcl
variable "resource_group_name" {
  description = "The name of the Resource Group"
  default = "my-resource-group"
}

variable "location" {
  description = "The location for resources"
  default = "East US"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  default = "my-vnet"
}
```

Alternatively, you can define them in a `.tfvars` file:

```hcl
resource_group_name = "my-resource-group"
location = "East US"
vnet_name = "my-vnet"
```

And then apply the variables when running `terraform apply`:

```bash
terraform apply -var-file="variables.tfvars"
```

### Conclusion

This Terraform script automates the creation of a resource group, a virtual network, subnets, a network security group, a key vault, and a virtual machine. To make it work:

1. Ensure you are authenticated using `az login`.
2. Set the correct subscription using `az account set`.
3. Initialize Terraform using `terraform init`.
4. Apply the changes using `terraform apply`.
