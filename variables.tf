variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "myRGKV-lod33066980"
  description = "Name of the resource group."
}

variable "username" {
  type        = string
  default     = "azureuser"
  description = "The username for local account on the vm."
}

variable "password" {
  type        = string
  default     = ""
  description = "The password for local account on the vm."
}
