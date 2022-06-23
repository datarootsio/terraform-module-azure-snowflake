data "azurerm_storage_account_blob_container_sas" "sas_token" {
  connection_string = azurerm_storage_account.iothubstorage.primary_connection_string
  container_name    = azurerm_storage_container.containermessages.name
  https_only        = false

  start = "2022-04-21"
  # TODO: Think about a better way to handle this
  expiry = "2023-04-21"

  permissions {
    read   = true
    add    = true
    create = true
    write  = true
    delete = true
    list   = true
  }

  cache_control       = "max-age=5"
  content_disposition = "inline"
  content_encoding    = "deflate"
  content_language    = "en-US"
  content_type        = "application/json"
}

data "azurerm_storage_account_blob_container_sas" "sas_token_predictions" {
  connection_string = azurerm_storage_account.iothubstorage.primary_connection_string
  container_name    = azurerm_storage_container.containerpredictions.name
  https_only        = false

  start = "2022-04-21"
  # TODO: Think about a better way to handle this
  expiry = "2023-04-21"

  permissions {
    read   = true
    add    = true
    create = true
    write  = true
    delete = true
    list   = true
  }

  cache_control       = "max-age=5"
  content_disposition = "inline"
  content_encoding    = "deflate"
  content_language    = "en-US"
  content_type        = "application/json"
}