provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tf_backend_rg" {
  name     = "cst8918-final-project-group7"
  location = "East US"  
}

resource "azurerm_storage_account" "tf_backend_storage" {
  name                     = "hanbackendstorage"
  resource_group_name      = azurerm_resource_group.tf_backend_rg.name
  location                 = azurerm_resource_group.tf_backend_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tf_backend_container" {
  name                  = "terraform-state"
  storage_account_name  = azurerm_storage_account.tf_backend_storage.name
  container_access_type = "private"
}

output "storage_account_name" {
  value = azurerm_storage_account.tf_backend_storage.name
}

output "container_name" {
  value = azurerm_storage_container.tf_backend_container.name
}
resource "azurerm_virtual_network" "tf_network" {
  name                = "cst8918-final-project-network"
  address_space       = ["10.0.0.0/14"]
  location            = azurerm_resource_group.tf_backend_rg.location
  resource_group_name = azurerm_resource_group.tf_backend_rg.name
}

resource "azurerm_subnet" "prod" {
  name                 = "prod"
  virtual_network_name = azurerm_virtual_network.tf_network.name
  resource_group_name  = azurerm_resource_group.tf_backend_rg.name
  address_prefixes     = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "test" {
  name                 = "test"
  virtual_network_name = azurerm_virtual_network.tf_network.name
  resource_group_name  = azurerm_resource_group.tf_backend_rg.name
  address_prefixes     = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "dev" {
  name                 = "dev"
  virtual_network_name = azurerm_virtual_network.tf_network.name
  resource_group_name  = azurerm_resource_group.tf_backend_rg.name
  address_prefixes     = ["10.2.0.0/16"]
}

resource "azurerm_subnet" "admin" {
  name                 = "admin"
  virtual_network_name = azurerm_virtual_network.tf_network.name
  resource_group_name  = azurerm_resource_group.tf_backend_rg.name
  address_prefixes     = ["10.3.0.0/16"]
}