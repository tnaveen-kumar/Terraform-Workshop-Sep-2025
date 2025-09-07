variable "rg_name_1" {
  description = "Name of the resource group"
  type        = string
  default     = "Dev"
}

variable "location_1" {
  description = "Location of the resource group"
  type        = string
  default     = "South India"
}

resource "azurerm_resource_group" "rg_block-1" {
  name = "${var.rg_name_1}-RG"   # Dev-RG
  location = "${var.location_1}"
  lifecycle {
    prevent_destroy = false
  }
}
