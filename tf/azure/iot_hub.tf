resource "azurerm_storage_account" "iothubstorage" {
  name                     = "rootsac22json${var.env}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true
}

#Blob container to send messages (json-format)
resource "azurerm_storage_container" "containermessages" {
  name                  = "json-blob-messages"
  storage_account_name  = azurerm_storage_account.iothubstorage.name
  container_access_type = "blob"
}

#Blob container to send predictions (json-format)
resource "azurerm_storage_container" "containerpredictions" {
  name                  = "json-blob-predictions"
  storage_account_name  = azurerm_storage_account.iothubstorage.name
  container_access_type = "blob"
}

# Create IoT Hub
resource "azurerm_iothub" "ih" {
  name                = "rootsacad2022-ih-wthr-${var.env}"
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
    name                       = "iot-messages-store"
    batch_frequency_in_seconds = 300
    # It's in bytes!
    max_chunk_size_in_bytes = 104857600
    container_name          = azurerm_storage_container.containermessages.name
    encoding                = "json"
    file_name_format        = "{iothub}/{partition}/{YYYY}-{MM}-{DD}/{HH}-{mm}"
  }

  #The end point for the predictions
  endpoint {
    type                       = "AzureIotHub.StorageContainer"
    connection_string          = azurerm_storage_account.iothubstorage.primary_blob_connection_string
    name                       = "iot-predictions-store"
    batch_frequency_in_seconds = 300
    max_chunk_size_in_bytes    = 104857600
    container_name             = azurerm_storage_container.containerpredictions.name
    encoding                   = "json"
    file_name_format           = "{iothub}/{partition}/{YYYY}-{MM}-{DD}/{HH}-{mm}"
  }

  #Routing from the device to the endpoint for messages
  route {
    name           = "sensor-to-blob"
    source         = "DeviceMessages"
    condition      = "$body.type = 'WeatherMeasurement'"
    endpoint_names = ["iot-messages-store"]
    enabled        = true
  }

  #Routing from the device to the endpoint for predictions
  route {
    name           = "predictions-to-blob"
    source         = "DeviceMessages"
    condition      = "$body.type = 'Prediction'"
    endpoint_names = ["iot-predictions-store"]
    enabled        = true
  }

  #Default routing
  route {
    name           = "default"
    source         = "DeviceMessages"
    condition      = "true"
    endpoint_names = ["events"]
    enabled        = true
  }

}


resource "azurerm_eventgrid_system_topic" "egstsnowflake" {
  name                   = "snowpipe-topic-${var.env}"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  source_arm_resource_id = azurerm_storage_account.iothubstorage.id
  topic_type             = "Microsoft.Storage.StorageAccounts"
}


resource "azurerm_storage_queue" "queuemessages" {
  name                 = "snowpipe-event-sub"
  storage_account_name = azurerm_storage_account.iothubstorage.name
}