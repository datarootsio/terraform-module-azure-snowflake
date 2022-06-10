resource "azurerm_storage_container" "container" {
  name                 = var.sc_images
  storage_account_name = azurerm_storage_account.imageingestion.name
}

#Blob container to send messages (json-format)
resource "azurerm_storage_container" "containermessages" {
  name                  = var.sc_messages
  storage_account_name  = azurerm_storage_account.iothubstorage.name
  container_access_type = var.sc_access_type
}

#Blob container to send predictions (json-format)
resource "azurerm_storage_container" "containerpredictions" {
  name                  = var.sc_predictions
  storage_account_name  = azurerm_storage_account.iothubstorage.name
  container_access_type = var.sc_access_type
}
