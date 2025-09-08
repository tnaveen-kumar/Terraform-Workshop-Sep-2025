resource "azurerm_resource_group" "rg" {
    name     = "${var.env_name}-rg"
    location = var.location
    tags     = var.tags
}