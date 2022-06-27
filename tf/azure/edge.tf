resource "azurerm_storage_account" "imageingestion" {
  name                     = "rootsac22media${var.env}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                 = "rootsac22container"
  storage_account_name = azurerm_storage_account.imageingestion.name
}