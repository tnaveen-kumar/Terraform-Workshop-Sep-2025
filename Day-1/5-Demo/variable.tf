variable "rg_name_1" {
  description = "Name of the resource group"
  type        = string
  default = "somevalue"
}

variable "location_1" {
  description = "Location of the resource group"
  type        = string
}

variable "tags" {
  type = map(string)
  default = {
    environment = "development"
    owner       = "Naveen"
    manager_by  = "terraform"
  }
}
