# Terraform Azure VNet and VM Setup with Key Vault Integration

This Terraform module sets up a **Virtual Network (VNet)** with both **public and private subnets**, a **Network Security Group (NSG)**, and a **Linux Virtual Machine (VM)** in the private subnet. 

This module integrates with **Azure Key Vault** to fetch sensitive values (like the admin username and SSH public key) securely during runtime.

## Prerequisites

- Must have an **Azure Subscription** and proper permissions.
- **Terraform** installed (version 1.5+).
- A **Key Vault** in your Azure subscription containing:
  - A secret for the **admin username** (`vm-admin-username`).
  - A secret for the **SSH public key** (`vm-ssh-public-key`).

## Module Overview

The module will create:
1. A **Resource Group**.
2. A **Virtual Network** with public and private subnets.
3. A **Network Security Group (NSG)** for the private subnet.
4. A **Linux Virtual Machine (VM)** in the private subnet.
5. The **VM's admin credentials** (username and SSH key) are retrieved securely from an **Azure Key Vault**.

## Usage

### Step 1: Set up your Key Vault in Azure

1. **Create a Key Vault** (if not already created).
2. Add the following secrets to the Key Vault:
   - **`vm-admin-username`**: The admin username for the VM.
   - **`vm-ssh-public-key`**: The SSH public key used for authentication.
