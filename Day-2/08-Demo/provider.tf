terraform {
  backend "azurerm" {
    resource_group_name  = "tf-datasource"
    storage_account_name = "mystorageaccountnav"
    container_name       = "remote"
    key                  = "moduleremote.tfstate"
    
  }
}

provider "azurerm" {
  features { 
  }
  subscription_id = "cd0aa948"
}