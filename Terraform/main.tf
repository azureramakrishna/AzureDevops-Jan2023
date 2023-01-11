# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name_01
  location = var.location_01
}

resource "azurerm_resource_group" "rg2" {
  name     = var.resource_group_name_02
  location = var.location_02
}

# Creaet a storage account
resource "azurerm_storage_account" "sa1" {
  name                     = var.storage_account_01
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_account" "sa2" {
  name                     = var.storage_account_02
  resource_group_name      = azurerm_resource_group.rg2.name
  location                 = azurerm_resource_group.rg2.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

