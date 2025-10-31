# modules/azure_firewall/main.tf
resource "azurerm_firewall" "this" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "firewall-ipconfig"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.firewall_ip.id
  }
}

resource "azurerm_public_ip" "firewall_ip" {
  name                         = "${var.firewall_name}-public-ip"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  allocation_method            = "Static"
  sku                          = "Standard"
}
