output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "admin_password" {
  sensitive = true
  value     = azurerm_windows_virtual_machine.my_terraform_vm_1.admin_password
}

output "vm_1_public_ips" {
  value = azurerm_windows_virtual_machine.my_terraform_vm_1.public_ip_addresses
}

output "vm_1_private_ips" {
  value = azurerm_windows_virtual_machine.my_terraform_vm_1.private_ip_addresses
}

output "vm_2_public_ips" {
  value = azurerm_windows_virtual_machine.my_terraform_vm_2.public_ip_addresses
}

output "vm_2_private_ips" {
  value = azurerm_windows_virtual_machine.my_terraform_vm_2.private_ip_addresses
}

