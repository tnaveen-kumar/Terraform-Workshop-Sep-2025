variable "storage_account_name" {
  type    = list
  default = ["stgacc1", "stgacc2", "stgacc3"]
}

variable "rg_name" {
  type    = string
  default = "demo-rg-storageaccount"
}

resource "random_id" "random_id_block" {
  byte_length = 5
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = "East US"
}

resource "azurerm_storage_account" "storageaccount" {
  count  = length(var.storage_account_name)
  name = "${var.storage_account_name[count.index]}${random_id.random_id_block.hex}"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    account_tier        = "Standard"
    account_replication_type = "LRS"
}