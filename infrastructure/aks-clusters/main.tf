provider "azurerm" {
  features {}
}

variable "resource_group_name" {
  description = "cst8918-final-project-group7"
}

variable "location" {
  description = "Location for the AKS clusters"
  default     = "East US"  
}

resource "azurerm_kubernetes_cluster" "test_cluster" {
  name                = "test-aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "test-aks"
  kubernetes_version  = "1.29.2"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }
    service_principal {
    client_id     = "354398b0-9244-4345-8260-3b7209b645a3"
    
  }
}

resource "azurerm_kubernetes_cluster" "prod_cluster" {
  name                = "prod-aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "prod-aks"
  kubernetes_version  = "1.29.2"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
    enable_auto_scaling = true
    min_count = 1
    max_count = 3
  }
  service_principal {
    client_id     = "354398b0-9244-4345-8260-3b7209b645a3"
    
  }
}
