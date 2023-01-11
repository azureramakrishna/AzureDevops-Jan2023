variable "resource_group_name_01" {
  type        = string
  description = "Name of the resource group 01"
  default     = "terraform-rg-01"
}

variable "location_01" {
  type        = string
  description = "Name of the location for resource group 01"
  default     = "centralindia"
}

variable "resource_group_name_02" {
  type        = string
  description = "Name of the resource group 02"
  default     = "terraform-rg-02"
}

variable "location_02" {
  type        = string
  description = "Name of the location for resource group 02"
  default     = "west Europe"
}

variable "storage_account_01" {
  type        = string
  description = "Name of the storage account 01"
  default     = "saanvikit2023001"
}


variable "storage_account_02" {
  default     = "saanvikit2023002"
}