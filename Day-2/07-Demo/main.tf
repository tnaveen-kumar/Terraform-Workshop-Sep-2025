module "dev-rg" {
  source      = "./Modules/RG"
  rg_name_1   = "Dev-RG-1"
  location_1  = "East US"
}

module "dev-vnet" {
  source            = "./Modules/Vnet"
  vnet_name_1       = "Dev-VNet-1"
  address_space_1   = "10.15.0.0/16"
    location_1       = module.dev-rg.rg_location_output
    rg_name_1        = module.dev-rg.rg_name_output
}