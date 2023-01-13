# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.30.0"
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

#Azure terraform backend state
terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-centralindia"
    storage_account_name = "csg10032000825eeb72"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# Create a publicip
resource "azurerm_public_ip" "pubip" {
  name                = var.public_ip_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

# Create a NSG
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create a NIC
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.snet.id
    public_ip_address_id          = azurerm_public_ip.pubip.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Associate NSG with subnet
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = data.azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create a Virtual Machine
resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  size                = var.vm_size
  admin_username      = var.adminuser
  admin_password      = data.azurerm_key_vault_secret.secret.value
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    name                 = "${var.vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_managed_disk" "example" {
  name                 = "${var.vm_name}-disk1"
  location             = data.azurerm_resource_group.rg.location
  resource_group_name  = data.azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.example.id
  virtual_machine_id = azurerm_windows_virtual_machine.vm.id
  lun                = "10"
  caching            = "ReadWrite"
}