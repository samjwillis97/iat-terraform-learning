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

variable "my_ip" {
  type    = string
  default = null
}
