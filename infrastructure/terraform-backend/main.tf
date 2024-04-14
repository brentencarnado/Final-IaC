provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tf_backend_rg" {
  name     = "cst8918-final-project-group7"
  location = "East US"  
}

resource "azurerm_storage_account" "tf_backend_storage" {
  name                     = "ferdbackendstorage"
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
