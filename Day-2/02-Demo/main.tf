##tf-datasource

data "azurerm_resource_group" "rg_data_block" {
  name = "tf-datasource"
}

output "print_rg_details" {
  value = data.azurerm_resource_group.rg_data_block.*
}

resource "azurerm_virtual_network" "myvnet" {
  name                = "my-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = data.azurerm_resource_group.rg_data_block.location
  resource_group_name = data.azurerm_resource_group.rg_data_block.name
}