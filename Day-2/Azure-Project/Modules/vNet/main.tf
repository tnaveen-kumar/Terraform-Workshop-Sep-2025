resource "azurerm_virtual_network" "vNet" {
    name                = "${var.env_name}-vnet"
    address_space       = [var.vpc-cidr]
    location            = var.location
    resource_group_name = var.env_name
    tags                = var.tags

}

resource "azurerm_subnet" "private_subnet" {
  name                 = "${var.env_name}-Private-Subnet"
  resource_group_name  = var.env_name
  virtual_network_name = azurerm_virtual_network.vNet.name
  address_prefixes     = [var.private-subnet-cidr]
}

resource "azurerm_subnet" "public_subnet" {
  name                 = "${var.env_name}-Public-Subnet"
  resource_group_name  = var.env_name
  virtual_network_name = azurerm_virtual_network.vNet.name
  address_prefixes     = [var.public-subnet-cidr]
}

resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.env_name
  virtual_network_name = azurerm_virtual_network.vNet.name
  address_prefixes     = [var.Bastion-subnet-cidr]
}

resource "azurerm_public_ip" "Public_ip" {
  name                = "Bastion-public-ip"
  location            = var.location
  resource_group_name = var.env_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "private_nic" {
  name                = "${var.env_name}-nic"
  location            = var.location
  resource_group_name = var.env_name
  tags                = var.tags
  ip_configuration {
    name                          = "sqlvm-ipconfig"
    subnet_id                     = azurerm_subnet.private_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}