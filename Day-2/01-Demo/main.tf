variable "rg_name" {
  description = "The name of the resource group in which to create the resources."
  type        = map(string)
  default = {
    "rg-dev" = "East US"
    "rg-test" = "West US"
    "rg-prod" = "South India"
  }
  
}

resource "azurerm_resource_group" "rg-name" {
    for_each = var.rg_name
    name = each.key
  location = each.value
}