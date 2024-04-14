provider "azurerm" {
  features {}
}

module "backend" {
  source = "./terraform-backend"
}

module "network" {
  source = "./base-network"
  group_number = "Group 7"
}

module "aks" {
  source               = "./aks-clusters"
  resource_group_name  = module.network.resource_group_name
}
