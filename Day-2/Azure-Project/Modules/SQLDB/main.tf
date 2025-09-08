resource "azurerm_mssql_server" "r_sql_server" {
  name                         = "${var.env_name}sqlserver"
  resource_group_name          = var.env_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_password
  public_network_access_enabled = true ##New Code
}

resource "azurerm_mssql_database" "r_sql_database" {
  name                = var.env_name
  server_id = "${azurerm_mssql_server.r_sql_server.id}"
  max_size_gb = 5
  transparent_data_encryption_enabled = true
tags = var.tags
}