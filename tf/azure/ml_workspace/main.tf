# Machine Learning workspace
resource "azurerm_machine_learning_workspace" "amlw" {
  name                    = local.ml_workspace_name
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  application_insights_id = azurerm_application_insights.as.id
  key_vault_id            = azurerm_key_vault.kv.id
  storage_account_id      = azurerm_storage_account.iothubstorage.id

  identity {
    type = var.ml_identity_type
  }
}