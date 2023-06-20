provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "resource_data"
  location = "ap-south-1"
}
resource "azurerm_container_registry" "example" {
  name                     = "sa"
  resource_group_name      = azurerm_resource_group.example.name  
  location                 = azurerm_resource_group.example.location 
  sku                      = "standard"
  admin_enabled            = "True"
}