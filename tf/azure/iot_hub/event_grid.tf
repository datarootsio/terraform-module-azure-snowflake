resource "azurerm_eventgrid_system_topic" "egstsnowflake" {
  name                   = local.event_grid_st_name
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  source_arm_resource_id = azurerm_storage_account.iothubstorage.id
  topic_type             = var.eg_st_topic_type
}


resource "azurerm_storage_queue" "queuemessages" {
  name                 = var.evst_es_prefix
  storage_account_name = azurerm_storage_account.iothubstorage.name
}


resource "azurerm_eventgrid_system_topic_event_subscription" "egstsubsc" {
  name                = local.event_grid_st_es_name
  system_topic        = azurerm_eventgrid_system_topic.egstsnowflake.name
  resource_group_name = azurerm_resource_group.rg.name

  storage_queue_endpoint {
    storage_account_id = azurerm_storage_account.iothubstorage.id
    queue_name         = azurerm_storage_queue.queuemessages.name
  }
}
