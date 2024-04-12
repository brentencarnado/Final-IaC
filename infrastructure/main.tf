variable "prefix_name" {
  type    = string
  default = "cst8918-a03-student"
}

variable "app_path" {
  type    = string
  default = "../"
}

variable "image_tag" {
  type    = string
  default = "latest"
}

variable "container_port" {
  type    = number
  default = 80
}

variable "public_port" {
  type    = number
  default = 80
}

variable "cpu" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 2
}

provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "${var.prefix_name}-rg"
  location = "East US"
}

# Create an Azure Container Registry
resource "azurerm_container_registry" "example" {
  name                     = "${var.prefix_name}acr"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  sku                      = "Basic"
  admin_enabled            = true
}

# Create an Azure Container Instance
resource "azurerm_container_group" "example" {
  name                = "${var.prefix_name}-container-group"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  restart_policy      = "Always"

  container {
    name   = var.prefix_name
    image  = "${azurerm_container_registry.example.login_server}/${var.prefix_name}:${var.image_tag}"
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = var.container_port
      protocol = "TCP"
    }

    environment_variables = {
      "PORT"           = var.container_port
      "WEATHER_API_KEY" = "7741c61b7903b69488a3ee7f1a9c8c1f"
    }
  }

  image_registry_credential {
    server   = azurerm_container_registry.example.login_server
    username = azurerm_container_registry.example.admin_username
    password = azurerm_container_registry.example.admin_password
  }

  ip_address_type = "public"
  ip_address {
    ports {
      port     = var.public_port
      protocol = "TCP"
    }
  }

  depends_on = [
    azurerm_container_registry.example,
  ]
}

output "hostname" {
  value = azurerm_container_group.example.fqdn
}

output "ip" {
  value = azurerm_container_group.example.ip_address
}

output "url" {
  value = "http://${azurerm_container_group.example.fqdn}:${var.container_port}"
}
