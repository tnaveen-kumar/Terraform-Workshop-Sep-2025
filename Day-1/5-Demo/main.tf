resource "azurerm_resource_group" "rg_block-1" {
  name = "${var.rg_name_1}-RG"   # Dev-RG
  location = "${var.location_1}"
  lifecycle {
    prevent_destroy = false
    create_before_destroy = true
    
  }
  tags = var.tags
}

output "rg_name" {
  value = azurerm_resource_group.rg_block-1.name
}

output "rg_name_id" {
  value = azurerm_resource_group.rg_block-1.id
}

output "rg_name_all" {
  value = azurerm_resource_group.rg_block-1.*
}

