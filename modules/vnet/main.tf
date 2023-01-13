resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [vnet_address_space]
  location            = var.rg_location
  resource_group_name = var.rg_name

  tags = {
    environment = var.env_prefix
  }
}
