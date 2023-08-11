output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "public_ip_addres" {
  value = azurerm_windows_virtual_machine.my_terraform_vm.public_ip_address
}

output "admin_password" {
  sensitive = true
  value = azurerm_windows_virtual_machine.my_terraform_vm.admin_password
}
