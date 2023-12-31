variable "resource_group_location" {
  type        = string
  default     = "australiaeast"
  description = "Location of the resource group."
}

variable "workload" {
  type    = string
  default = "iat"
}

variable "environment" {
  type    = string
  default = "testing"
}

variable "author" {
  type    = string
  default = "swillis"
}

variable "vm_resource_group_name" {
  type        = string
  default     = "rg-swillis-learning-vm"
  description = "Override name of the vm resource group."
}

variable "storage_resource_group_name" {
  type        = string
  default     = "rg-swillis-learning-storage"
  description = "Override name of the storage resource group."
}

variable "my_ip" {
  type    = string
  default = null
}

variable "vm_name" {
  type        = string
  default     = null
  description = "Override name of the virtual machine."
}

variable "vm_username" {
  type        = string
  default     = "azureuser"
  description = "The username for local account on the vm."
}

variable "vm_password" {
  type        = string
  default     = null
  description = "The password for local account on the vm."
}

