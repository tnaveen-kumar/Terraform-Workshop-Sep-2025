locals {
  common_tags = {
    env   = "Dev"
    owner = "Naveen"
  }
}

module "rg-mod" {
  source   = "./Modules/ResourceGroup"
  env_name = "dev"
  location = "South India"
  tags     = local.common_tags
}

module "my-vNet" {
  source              = "./Modules/vNet"
  vpc-cidr            = "10.10.0.0/16"
  env_name            = module.rg-mod.rg_name
  location            = module.rg-mod.location
  tags                = local.common_tags
  public-subnet-cidr  = "10.10.1.0/24"
  private-subnet-cidr = "10.10.2.0/24"
  Bastion-subnet-cidr = "10.10.0.0/24"
}

module "Bastion_host" {
  source       = "./Modules/Bastion"
  location     = module.rg-mod.location
  env_name     = module.rg-mod.rg_name
  tags         = local.common_tags
  public_ip_id = module.my-vNet.public_ip_id
  subnet_id    = module.my-vNet.bastion_subnet_id
}

module "sql-vm" {
  source                = "./Modules/VirtualMachine"
  env_name              = module.rg-mod.rg_name
  location              = module.rg-mod.location
  network_interface_ids = module.my-vNet.azurerm_network_interface_id
}

data "azurerm_key_vault" "mykeyvault" {
  name                = "naveen-tf-vault"
  resource_group_name = "tf-datasource"
}

data "azurerm_key_vault_secret" "sql_admin_username" {
  name         = "azuresqldb-username"
  key_vault_id = data.azurerm_key_vault.mykeyvault.id
}

data "azurerm_key_vault_secret" "sql_password" {
  name         = "azuresqldb-password"
  key_vault_id = data.azurerm_key_vault.mykeyvault.id
}

module "AzureSQLDB" {
  source             = "./Modules/SQLDB"
  env_name           = module.rg-mod.rg_name
  location           = module.rg-mod.location
  sql_admin_username = data.azurerm_key_vault_secret.sql_admin_username.value
  sql_password       = data.azurerm_key_vault_secret.sql_password.value
  #sql_password        = "YourPassword1234!"
  tags = local.common_tags
}