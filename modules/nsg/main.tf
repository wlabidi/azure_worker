resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = var.sg_rg_location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "SSH_Inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.source_address_prefix_nsg_inbound
    destination_address_prefix = "${var.private_ip_address}"
  }
	security_rule {
    name                       = "Everything_Outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "${var.private_ip_address}"
    destination_address_prefix = "*"
  }

}
