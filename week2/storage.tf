# Create storage account
resource "azurerm_storage_account" "my_storage_account" {
  name                     = module.naming.storage_account.name
  location                 = azurerm_resource_group.storage_rg.location
  resource_group_name      = azurerm_resource_group.storage_rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Cool"

  network_rules {
    default_action = "Deny"
    ip_rules       = var.my_ip != null ? [var.my_ip] : []
  }
}

# Creates the storage container
# FIXME: Can't create this when the network rule is enabled in storage_account
resource "azurerm_storage_container" "my_storage_container" {
  name                  = module.naming.storage_container.name
  storage_account_name  = azurerm_storage_account.my_storage_account.name
  container_access_type = "private" # TODO: Check this
}


# This adds a blob file to the storage container
resource "azurerm_storage_blob" "my_storage_blob" {
  name                   = "licenses/LICENSE"
  storage_account_name   = azurerm_storage_account.my_storage_account.name
  storage_container_name = azurerm_storage_container.my_storage_container.name
  type                   = "Block"
  source                 = "./resources/LICENSE"
  access_tier            = "Hot"
}

# Creates the azure file share
# FIXME: Can't create this when the network rule is enabled in storage_account
resource "azurerm_storage_share" "my_storage_share" {
  name                 = module.naming.storage_share.name
  storage_account_name = azurerm_storage_account.my_storage_account.name
  quota                = 1 # Max size in GB
}
