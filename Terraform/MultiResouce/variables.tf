variable "clientid" {
  type        = string  
  default     = "ce1425fc-f3d9-4afa-a1df-9786245f41fc"
}

variable "clientsecret" {
  type        = string
  default = ""
}

variable "tenantid" {
  type        = string  
  default     = "459865f1-a8aa-450a-baec-8b47a9e5c904"
}

variable "subscriptionid" {
  type        = string  
  default     = "6e4924ab-b00c-468f-ae01-e5d33e8786f8"
}

variable "resource_group_name" {
  type        = string  
  default     = "multi-storage-rg"
}

variable "location" {
  type        = string  
  default     = "eastus"
}

variable "storage_account_name" {
  type        = string  
  default     = "saanvikit"
}

variable "count_value" {
  type        = number  
  default     = 5
}