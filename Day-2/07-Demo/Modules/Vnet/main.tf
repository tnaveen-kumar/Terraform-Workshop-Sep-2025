resource "azurerm_virtual_network" "vnet-name" {
    name                = var.vnet_name_1
    address_space       = [var.address_space_1]
    location            = var.location_1
    resource_group_name = var.rg_name_1
}