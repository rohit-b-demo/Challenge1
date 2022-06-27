resource "azurerm_resource_group" "aap-rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tags
}
