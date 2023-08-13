locals {
  vm_name_1   = var.vm_name == null ? format("vm-%s-%s-%s-01", var.workload, var.environment, var.resource_group_location) : format("%s-01", var.vm_name)
  vm_name_2   = var.vm_name == null ? format("vm-%s-%s-%s-02", var.workload, var.environment, var.resource_group_location) : format("%s-02", var.vm_name)
  vm_password = var.vm_password == null ? random_password.password.result : var.vm_password
}

resource "random_password" "password" {
  length      = 20
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true
}

# Create virtual network
resource "azurerm_virtual_network" "my_terraform_network" {
  name                = module.naming.virtual_network.name
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create subnet
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = module.naming.subnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.my_terraform_network.name
  address_prefixes     = ["10.1.0.0/24"]
}

# Create Network Security Group and rules
resource "azurerm_network_security_group" "my_terraform_nsg" {
  name                = module.naming.network_security_group.name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interfaces
resource "azurerm_network_interface" "my_terraform_nic_1" {
  name                = format("%s-01", module.naming.network_interface.name)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "my_terraform_nic_2" {
  name                = format("%s-02", module.naming.network_interface.name)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Connect the security group to the subnet
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.my_terraform_subnet.id
  network_security_group_id = azurerm_network_security_group.my_terraform_nsg.id
}

# Create virtual machines
resource "azurerm_windows_virtual_machine" "my_terraform_vm_1" {
  name                  = local.vm_name_1
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic_1.id]
  size                  = "Standard_DS1_v2"

  admin_username = var.vm_username
  admin_password = local.vm_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-datacenter"
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "my_terraform_vm_2" {
  name                  = local.vm_name_2
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic_2.id]
  size                  = "Standard_DS1_v2"

  admin_username = var.vm_username
  admin_password = local.vm_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-datacenter"
    version   = "latest"
  }
}
