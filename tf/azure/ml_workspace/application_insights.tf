resource "azurerm_application_insights" "as" {
  name                = local.application_insights_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = var.application_insights_type
}