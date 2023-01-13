# module rg
 module "rg" {
   source             =  "./modules/rg"
   rg_name            = var.resource_group_name
   rg_location        = var.rg_location

 }



#module VNET
module "vnet" {
  source             =   "./modules/vnet"
  rg_name            = module.rg.sg_rg_name 
  env_prefix         = var.env_prefix
  rg_location        = module.rg.sg_rg_location
  vnet_address_space = var.vnet_address_space
  vnet_name          = var.vnet_name

}
# module Subnet 

module "subnet" {

source              =  "./modules/subnets"
subnet_name         = var.subnet_name
rg_location         = module.rg.sg_rg_location
rg_name             = module.rg.sg_rg_name
vnet_name           = module.vnet.vnet_name

}
# module NSG

module "nsg" {

  source                      = "./modules/nsg"
  network_security_group_name = var.network_security_group_name
  rg_location                 = module.rg.sg_rg_location
  rg_name                     = module.rg.sg_rg_name
  source_address_prefix_nsg_inbound = var.source_address_prefix_nsg_inbound
  private_ip_address = module.networkInterfaces.private_ip_address
}

# module NETWORK INTERFACE 
module "networkInterfaces" {
    source = "./modules/networkInterfaces"
    network_interface_name =  var.network_interface_name
    rg_location         = module.rg.sg_rg_location
    rg_name             = module.rg.sg_rg_name
    subnet_id           = module.subnet.subnet_id
}

# module WORKER JENKINS 

module "vmworker" {
  source = "./modules/vmworker"
  rg_location         = module.rg.sg_rg_location
  rg_name             = module.rg.sg_rg_name
  linux_virtual_machine_name  = var.linux_virtual_machine_name
  network_interface_id = module.networkInterfaces.network_interface_id
  
}