# Create a resource group
resource "azurerm_resource_group" "webapp-rg" {
  name     = local.resource_group_name
  location = local.location
}

