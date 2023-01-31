variable "clientid" {
  type        = string  
  default     = "ce1425fc-f3d9-4afa-a1df-9786245f41fc"
}

variable "clientsecret" {
  type        = string
  default = "jA48Q~hG6j07H3Rc6fPptUshMcr3l3qBb2AEebKD"
}

variable "tenantid" {
  type        = string  
  default     = "459865f1-a8aa-450a-baec-8b47a9e5c904"
}

variable "subscriptionid" {
  type        = string  
  default     = "6e4924ab-b00c-468f-ae01-e5d33e8786f8"
}

# AzureRM provider version
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.30.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscriptionid
  client_id       = var.clientid
  client_secret   = var.clientsecret
  tenant_id       = var.tenantid
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Creaet a storage account
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
