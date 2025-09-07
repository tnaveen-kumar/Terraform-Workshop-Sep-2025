terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
  
}

provider "azurerm" {
  features {
    virtual_machine {

    }
  }
  subscription_id = "cd0aa948"

}


resource "azurerm_resource_group" "example" {
  name = "myrg-terraform-demo"
  location = "South India"
  lifecycle {
    prevent_destroy = false

  }
}
