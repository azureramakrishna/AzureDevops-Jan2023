variable "resource_group_name" {
  type        = string  
  default     = "terraform-rg"
}

variable "virtual_network_name" {
  type        = string  
  default     = "terraform-vnet"
}

variable "subnet_name" {
  type        = string  
  default     = "default"
}

variable "public_ip_name" {
  type        = string  
  default     = "terraform-pubip"
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
