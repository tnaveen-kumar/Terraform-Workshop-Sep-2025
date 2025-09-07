resource "azurerm_resource_group" "rg_block-1" {
  name = "${var.rg_name_1}-RG"   # Dev-RG
  location = "${var.location_1}"
  lifecycle {
    prevent_destroy = false
  }
  tags = { environment = "development" }
}
