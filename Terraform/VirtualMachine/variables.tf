variable "resource_group_name" {
  type        = string
  description = "Name of the resource group 01"
  default     = "terraform-rg-01"
}

variable "location" {
  type        = string
  description = "Name of the location for resource group 01"
  default     = "centralindia"
}


variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
  default     = "saanvikit2023001"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
  default     = "terraform-vnet-01"
}

variable "virtual_network_addressPrefix" {
  type        = list
  default     = ["172.16.0.0/24"]
}

variable "subnet_name" {
  type        = string
  default     = "terraform-snet-01"
}

variable "subnet_addressPrefix" {
  type        = list
  default     = ["172.16.0.0/24"]
}

variable "public_ip_name" {
  type        = string
  default     = "terraform-pubip-01"
}

variable "nsg_name" {
  type        = string
  default     = "terraform-nsg-01"
}

variable "nic_name" {
  type        = string
  default     = "terraform-nic-01"
}

variable "vm_name" {
  type        = string
  default     = "terraform-vm-01"
}

variable "vm_size" {
  type        = string
  default     = "Standard_Ds1_v2"
}

variable "adminuser" {
  type        = string
  default     = "azureuser"
}

variable "adminPassword" {
  type        = string
  default     = "Azuredevops@12345"
}

