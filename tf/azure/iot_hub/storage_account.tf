resource "azurerm_storage_account" "iothubstorage" {
  name                     = local.storage_account_iot_hub_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.sc_access_type
  account_replication_type = var.sc_account_repl
  allow_blob_public_access = true
}

resource "azurerm_storage_account" "imageingestion" {
  name                     = local.image_ingestion_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.image_ingestion_account_tier
  account_replication_type = var.image_ingestion_account_repl
}