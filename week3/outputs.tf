output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "admin_password" {
  sensitive = true
  value     = azurerm_windows_virtual_machine.my_terraform_vm_1.admin_password
}
