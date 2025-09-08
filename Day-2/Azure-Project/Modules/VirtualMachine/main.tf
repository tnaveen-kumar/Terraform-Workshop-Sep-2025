resource "azurerm_windows_virtual_machine" "example" {
  name                = "${var.env_name}-sqlvm"
  resource_group_name = var.env_name
  location            = var.location
  size                = "Standard_D8ds_v4"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    var.network_interface_ids
    #azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftSQLServer"
    offer     = "sql2022-ws2022"
    sku       = "sqldev-gen2"
    version   = "latest"
    
  }
}
