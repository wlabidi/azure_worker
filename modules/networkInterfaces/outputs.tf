output "private_ip_address" {
    value = azurerm_network_interface.network_interface.private_ip_address

}
output "network_interface_id" {
    value =  azurerm_network_interface.network_interface.id
}
