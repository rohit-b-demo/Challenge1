output "name" {
    value = azurerm_resource_group.aap-rg.name
    description = "Name of the resource group."
}

output "location_id" {
    value = azurerm_resource_group.aap-rg.location
    description = "Location id of the resource group"
}
