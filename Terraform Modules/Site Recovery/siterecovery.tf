# main.tf

# Azure Recovery Services Vault
resource "azurerm_recovery_services_vault" "example" {
  name                = var.recovery_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                  = "Standard"
}

# Protection Container
resource "azurerm_site_recovery_protection_container" "example" {
  name                            = var.container_name
  resource_group_name             = var.resource_group_name
  recovery_vault_id              = azurerm_recovery_services_vault.example.id
  fabric_name                    = var.fabric_name
  protection_container_type      = "Azure"
}

# Protection Container Mapping
resource "azurerm_site_recovery_protection_container_mapping" "example" {
  name                           = var.container_mapping_name
  protection_container_id        = azurerm_site_recovery_protection_container.example.id
  resource_group_name            = var.resource_group_name
  recovery_vault_id              = azurerm_recovery_services_vault.example.id
  source_replication_factor     = 1
}
