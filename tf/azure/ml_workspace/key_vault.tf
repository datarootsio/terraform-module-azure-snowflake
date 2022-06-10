resource "azurerm_key_vault" "kv" {
  name                     = local.key_vault_name
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = var.sku_standard
  purge_protection_enabled = false
}