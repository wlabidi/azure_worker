## Virtual Network ID
output "vnet_name" {
  description = "Virtual Network ID"
  value = module.azurerm_virtual_network.vnet.name
}
