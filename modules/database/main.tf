resource "azurerm_mysql_server" "mysql" {
  name                = var.primary_database
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  administrator_login          = var.primary_database_admin
  administrator_login_password = var.primary_database_password

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mssql_virtual_network_rule" "mysql" {
  name      = "sql-vnet-rule"
  server_id = azurerm_mysql_server.mysql.id
  subnet_id = var.db_subnet_id
}

resource "azurerm_mysql_database" "db" {
  name                = "db"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}