variable "rg_name" {
  type        = string
  description = "RG name in Azure"
}

variable "resource_group_location" {
  type        = string
  description = "RG location in Azure"
}

variable "vnet_name" {
  type        = string
  description = "VNET name in Azure"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name in Azure"
}

/*variable "public_ip_name" {
  type        = string
  description = "Public IP name in Azure"
}
*/
variable "network_security_group_name" {
  type        = string
  description = "NSG name in Azure"
}

variable "network_interface_name" {
  type        = string
  description = "NIC name in Azure"
}

variable "linux_virtual_machine_name" {
  type        = string
  description = "Linux VM name in Azure"
}

variable "user_data_file" {
    description = "User data to provision linux slave"
    type        = string
    default     = "./data_files/user-data.sh.tpl"
}

variable "source_address_prefix_nsg_inbound" {
  description = "Source address for NSG"
  type = string
  default = "192.196.226.55"
}
variable "env_prefix" {
  
}
variable "vnet_address_space" {
  
}