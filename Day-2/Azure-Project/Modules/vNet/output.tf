output "bastion_subnet_id" {
  value = azurerm_subnet.bastion_subnet.id
}

output "public_ip_id" {
  value = azurerm_public_ip.Public_ip.id
}


output "myvnet_id" {
  value = azurerm_virtual_network.vNet.id
}

output "azurerm_network_interface_id" {
  value = azurerm_network_interface.private_nic.id
}