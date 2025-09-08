resource "azurerm_resource_group" "rg-name" {
    name     = var.rg_name_1
    location = var.location_1
}

output "rg_name_output" {
    value = azurerm_resource_group.rg-name.name
  
}

output "rg_location_output" {
    value = azurerm_resource_group.rg-name.location
}   