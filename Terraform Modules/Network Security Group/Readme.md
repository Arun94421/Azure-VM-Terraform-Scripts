## 1. Introduction

This Terraform project provides a **modular** approach to creating an **Azure Network Security Group (NSG)**. The module allows you to define various **security rules** (e.g., allow SSH, HTTP, or HTTPS traffic) and **tags** for categorizing the NSG. This module is reusable and can be integrated with other Terraform configurations, such as **virtual networks** or **VM deployments**.

---

## 2. Prerequisites

Before running this Terraform module, ensure you have the following:

### 2.1. Required Tools

- **[Terraform](https://www.terraform.io/downloads.html)**: Version 1.5.0 or higher.
- **[Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)**: For authenticating and interacting with Azure resources.

### 2.2. Azure Account

Make sure you have an **Azure** subscription and are authenticated via the **Azure CLI**:

bash:
az login
