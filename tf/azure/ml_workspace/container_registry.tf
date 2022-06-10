resource "azurerm_container_registry" "cr" {
  name                = local.container_registry_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.sku_standard
  admin_enabled       = true
}