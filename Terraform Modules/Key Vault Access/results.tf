# results.tf

output "admin_username" {
  description = "The admin username stored in Key Vault"
  value       = azurerm_key_vault_secret.admin_username.value
}

output "ssh_key" {
  description = "The SSH key stored in Key Vault"
  value       = azurerm_key_vault_secret.ssh_key.value
}
