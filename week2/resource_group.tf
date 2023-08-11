resource "azurerm_resource_group" "storage_rg" {
  name     = var.storage_resource_group_name == null ? module.naming.resource_group.name : var.storage_resource_group_name
  location = var.resource_group_location
  tags = {
    source      = "terraform"
    Environment = var.environment
    Owner       = var.author
  }
}

resource "azurerm_resource_group" "vm_rg" {
  name     = var.vm_resource_group_name == null ? module.naming.resource_group.name : var.vm_resource_group_name
  location = var.resource_group_location
  tags = {
    source      = "terraform"
    Environment = var.environment
    Owner       = var.author
  }
}

