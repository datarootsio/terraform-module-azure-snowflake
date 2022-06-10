resource "azurerm_storage_account" "sa-ml" {
  name                     = local.storage_acc_name
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_repl
}