resource "azurerm_storage_account" "sa" {
  name                     = module.naming.storage_account.name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "sqlserver" {
  name                         = module.naming.mssql_server.name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "sqldb" {
  name                        = "AdventureWorks"
  server_id                   = azurerm_mssql_server.sqlserver.id
  sample_name                 = "AdventureWorksLT"
  sku_name                    = "GP_S_Gen5_2"
  min_capacity                = 1
  auto_pause_delay_in_minutes = -1
}

resource "azurerm_mssql_firewall_rule" "sql_firewall_rule" {
  name             = module.naming.sql_firewall_rule.name
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = local.public_ip
  end_ip_address   = local.public_ip
}

