resource "azurerm_network_interface" "network_interface" {
  name                = var.network_interface_name #OK
  location            = var.rg_location #OK
  resource_group_name = var.rg_name #OK

  ip_configuration {
    name                          = "Jenkins_linux_slave_IP" #OK
    subnet_id                     = var.subnet.id #OK
    private_ip_address_allocation = "Dynamic" #OK
  }

}
