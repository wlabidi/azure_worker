resource "azurerm_linux_virtual_machine" "cicd_linux_slave" { #OK
  name                  = var.linux_virtual_machine_name #OK
  location              = var.rg_location #OK
  resource_group_name   = var.rg_name #OK
  network_interface_ids = [var.network_interface_id] #OK
  size                  = "Standard_D2s_v3" #OK

  admin_username        = "cloud-user" #OK
  computer_name         = "unxgtsprdeuncicd001" #OK
  custom_data           = base64encode(data.template_file.user_data.rendered) #OK
  #source_image_id       = "${data.azurerm_shared_image.osfactory-centos.id}" #OK
	source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
		sku       = "7.5"
    version   = "latest"
  }

  os_disk {
    name                 = "cicd_os_disk"
    caching              = "ReadWrite"
    disk_size_gb         = 50
    storage_account_type = "Standard_LRS"
  }



 admin_ssh_key {
        username = "cloud-user"
        public_key = "${file("keys/slave.pub")}"
    }



}
