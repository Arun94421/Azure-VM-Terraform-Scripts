# modules/azure_firewall/outputs.tf
output "firewall_public_ip" {
  description = "Public IP of the Azure Firewall"
  value       = azurerm_public_ip.firewall_ip.ip_address
}
