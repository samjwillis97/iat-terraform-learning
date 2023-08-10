# NOTES: I removed network security groups and file storage from this sample

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
  tags = {
    source      = "terraform"
    Environment = var.environment
    Owner       = "Sam Willis"
  }
}

locals {
  vm_name = var.vm_name == "" ? format("%s-%s-%s", "vm", var.name, var.environment) : var.vm_name
}


# Create virtual network
resource "azurerm_virtual_network" "my_terraform_network" {
  name                = format("%s-%s-%s", "vn", var.name, var.environment)
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create subnet
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = format("%s-%s-%s", "sbn-internal", var.name, var.environment)
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.my_terraform_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
  name                = format("%s-%s-%s", "nic", var.name, var.environment)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = local.vm_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = "Standard_B1ls"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = local.vm_name
  disable_password_authentication = false
  admin_username                  = var.username
  admin_password                  = var.password
}
