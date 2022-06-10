resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location

  tags = {
    managed-by  = var.managed_tag
    environment = var.env
  }
}
