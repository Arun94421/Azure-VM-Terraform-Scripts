# main.tf

resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "standard"
  tenant_id           = var.tenant_id

  tags = var.tags
}

resource "azurerm_key_vault_secret" "admin_username" {
  name         = "admin-username"
  value        = var.admin_username
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "ssh_key" {
  name         = "ssh-key"
  value        = var.ssh_key
  key_vault_id = azurerm_key_vault.kv.id
}

output "admin_username" {
  value = azurerm_key_vault_secret.admin_username.value
}

output "ssh_key" {
  value = azurerm_key_vault_secret.ssh_key.value
}

