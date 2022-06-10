# Create IoT Hub
resource "azurerm_iothub" "ih" {
  name                = local.iot_hub_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku {
    name     = "S1"
    capacity = "1"
  }

  #The end point for the messages
  endpoint {
    type                       = "AzureIotHub.StorageContainer"
    connection_string          = azurerm_storage_account.iothubstorage.primary_blob_connection_string
    name                       = var.iot_messages_name
    batch_frequency_in_seconds = var.batch_frequency_in_seconds
    max_chunk_size_in_bytes    = var.max_chunk_size_in_bytes
    container_name             = azurerm_storage_container.containermessages.name
    encoding                   = "json"
    file_name_format           = "{iothub}/{partition}/{YYYY}-{MM}-{DD}/{HH}-{mm}"
  }

  #The end point for the predictions
  endpoint {
    type                       = "AzureIotHub.StorageContainer"
    connection_string          = azurerm_storage_account.iothubstorage.primary_blob_connection_string
    name                       = var.iot_predictions_name
    batch_frequency_in_seconds = var.max_chunk_size_in_bytes
    max_chunk_size_in_bytes    = var.max_chunk_size_in_bytes
    container_name             = azurerm_storage_container.containerpredictions.name
    encoding                   = "json"
    file_name_format           = "{iothub}/{partition}/{YYYY}-{MM}-{DD}/{HH}-{mm}"
  }

  #Routing from the device to the endpoint for messages
  route {
    name           = "sensor-to-blob"
    source         = var.iot_source
    condition      = "$body.type = 'WeatherMeasurement'"
    endpoint_names = [var.iot_messages_name]
    enabled        = true
  }

  #Routing from the device to the endpoint for predictions
  route {
    name           = "predictions-to-blob"
    source         = var.iot_source
    condition      = "$body.type = 'Prediction'"
    endpoint_names = [var.iot_predictions_name]
    enabled        = true
  }

  #Default routing
  route {
    name           = "default"
    source         = var.iot_source
    condition      = "true"
    endpoint_names = ["events"]
    enabled        = true
  }

}