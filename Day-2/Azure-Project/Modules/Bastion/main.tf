resource "azurerm_bastion_host" "bastion_host" {
  name                = "${var.env_name}-bastion"
  location            = var.location
  resource_group_name = var.env_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_id
  }
  tags = var.tags
}