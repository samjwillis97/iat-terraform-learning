variable "resource_group_location" {
  type        = string
  default     = "eastus2"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = null
  description = "Name of the resource group."
}

variable "vm_name" {
  type        = string
  default     = "virtual-machine"
  description = "Name of the virtual machine."
}

variable "username" {
  type        = string
  default     = "azureuser"
  description = "The username for local account on the vm."
}

variable "password" {
  type        = string
  default     = null
  description = "The password for local account on the vm."
}
