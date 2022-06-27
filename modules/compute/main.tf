resource "azurerm_availability_set" "app_availabilty_set" {
  name                = "app_availabilty_set"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
 }

resource "azurerm_network_interface" "app-net-interface" {
    name = "app-network"
    resource_group_name = var.resource_group_name
    location = var.resource_group_location

    ip_configuration{
        name = "app-webserver"
        subnet_id = var.app_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "app-vm" {
  name = "app-vm"
  location = var.resource_group_location
  resource_group_name = var.resource_group_name
  network_interface_ids = [ azurerm_network_interface.app-net-interface.id ]
  availability_set_id = azurerm_availability_set.app_availabilty_set.id
  vm_size = "Standard_D2s_v3"
  delete_os_disk_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "app-disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = var.app_host_name
    admin_username = var.app_username
    admin_password = var.app_os_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}