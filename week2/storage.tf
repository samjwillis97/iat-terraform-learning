# Create storage account
resource "azurerm_storage_account" "my_storage_account" {
  name                     = module.naming.storage_account.name
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Create Azure Storage Firewall, I think this is what is wanted
  # Might actually want to use firewall_network_rule_collection
  network_rules {
    default_action             = "Deny"
    ip_rules                   = var.my_ip != null ? [var.my_ip] : []
    virtual_network_subnet_ids = [azurerm_subnet.my_terraform_subnet.id]
  }

  # TODO: Redundancy?
  # TODO: Access Tiers?
  # TODO: Only allow access from specific ip addresses
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
  name                   = "LICENSE"
  storage_account_name   = azurerm_storage_account.my_storage_account.name
  storage_container_name = azurerm_storage_container.my_storage_container.name
  type                   = "Block"
  source                 = "./resources/LICENSE"
}

# Creates the azure file share
# FIXME: Can't create this when the network rule is enabled in storage_account
resource "azurerm_storage_share" "my_storage_share" {
  name                 = module.naming.storage_share.name
  storage_account_name = azurerm_storage_account.my_storage_account.name
  quota                = 1 # Max size in GB
}
