# # Create virtual network
# resource "azurerm_virtual_network" "network" {
#   name                = module.naming.virtual_network.name
#   address_space       = ["10.1.0.0/24"]
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
# }
# 
# # Create subnet
# resource "azurerm_subnet" "subnet" {
#   name                 = module.naming.subnet.name
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.network.name
#   address_prefixes     = ["10.1.0.0/24"]
# }

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
  name         = "AdventureWorks"
  server_id    = azurerm_mssql_server.sqlserver.id
  license_type = "BasePrice"
  sample_name  = "AdventureWorksLT"
  sku_name     = "GP_S_Gen5_2"
}


