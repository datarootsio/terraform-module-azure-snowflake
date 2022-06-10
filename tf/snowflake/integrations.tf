resource "snowflake_storage_integration" "azure_external" {
  provider                  = snowflake.terraform
  type                      = var.external_stage
  storage_provider          = var.storage_provider
  azure_tenant_id           = data.azurerm_client_config.current.tenant_id
  name                      = local.storage_integration_name
  comment                   = "A storage integration."
  enabled                   = true
  storage_allowed_locations = ["azure://rootsac22json${var.env}.blob.core.windows.net/json-blob-messages", "azure://rootsac22json${var.env}.blob.core.windows.net/json-blob-predictions"]
}

resource "snowflake_storage_integration" "azure_external_sandbox" {
  provider         = snowflake.terraform
  type             = var.external_stage
  storage_provider = var.storage_provider
  azure_tenant_id  = data.azurerm_client_config.current.tenant_id
  name             = "${local.storage_integration_name}_SANDBOX"
  comment          = "A storage integration for Sandbox."
  enabled          = true
  storage_allowed_locations = ["azure://rootsac22json.blob.core.windows.net/json-blob",
  "azure://rootsac22json.blob.core.windows.net/json-predictions"]
}

resource "snowflake_notification_integration" "azure_queue" {
  provider                        = snowflake.terraform
  name                            = local.notification_integration_name
  enabled                         = true
  type                            = var.notification_integration_type
  notification_provider           = var.notification_integration_provider
  azure_storage_queue_primary_uri = "https://rootsac22json${var.env}.queue.core.windows.net/snowpipe-event-sub"
  azure_tenant_id                 = data.azurerm_client_config.current.tenant_id
}

resource "snowflake_notification_integration" "azure_queue_sandbox" {
  provider                        = snowflake.terraform
  name                            = "${local.notification_integration_name}_SANDBOX"
  enabled                         = true
  type                            = var.notification_integration_type
  notification_provider           = var.notification_integration_provider
  azure_storage_queue_primary_uri = "https://rootsac22json.queue.core.windows.net/snowpipe-queue"
  azure_tenant_id                 = data.azurerm_client_config.current.tenant_id
}
