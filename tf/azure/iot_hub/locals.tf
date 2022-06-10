locals {
  event_grid_st_name           = "${var.eg_st_name}-${var.env}"
  event_grid_st_es_name        = "${var.evst_es_prefix}-${var.env}"
  storage_account_iot_hub_name = "${var.sa_iot_hub_name}-${var.env}"
  image_ingestion_name         = "${var.image_ingestion_prefix}-${var.env}"
  iot_hub_name                 = "${var.iot_hub_prefix}-${var.env}"
}