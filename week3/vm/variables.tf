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

variable "resource_group_name" {
  type        = string
  default     = "rg-swillis-learning"
  description = "Override name of the resource group."
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

variable "my_ip" {
  type    = string
  default = null
}
