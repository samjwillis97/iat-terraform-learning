variable "resource_group_location" {
  type        = string
  default     = "australiaeast"
  description = "Location of the resource group."
}

variable "workload" {
  type        = string
  default     = "iat"
  description = "Workload name for tags and naming."
}

variable "environment" {
  type        = string
  default     = "testing"
  description = "Environment name for tags and naming."
}

variable "author" {
  type        = string
  default     = "swillis"
  description = "Override name of author."
}

variable "resource_group_name" {
  type        = string
  default     = "rg-swillis-learning"
  description = "Override name of the resource group."
}

variable "public_ip" {
  type        = string
  default     = null
  description = "Override value of public ip address."
}
