variable "env" {
  description = "Environment for resources"
  type        = string
}

variable "eg_st_topic_type" {
  type    = string
  default = "Microsoft.Storage.StorageAccounts"
}

variable "eg_st_name" {
  type    = string
  default = "snowpipe-topic"
}

variable "image_ingestion_prefix" {
  type    = string
  default = "rootsac22media"
}

variable "sa_iot_hub_name" {
  type    = string
  default = "rootsac22json"
}

variable "evst_es_prefix" {
  type    = string
  default = "snowpipe-event-sub"
}

variable "sc_images" {
  type    = string
  default = "rootsac22container"
}

variable "sc_messages" {
  type    = string
  default = "json-blob-messages"
}

variable "sc_predictions" {
  type    = string
  default = "json-blob-predictions"
}

variable "sc_access_type" {
  type    = string
  default = "blob"
}

variable "ac_account_tier" {
  type    = string
  default = "Standard"
}

variable "sc_account_repl" {
  type    = string
  default = "LRS"
}

variable "iot_hub_prefix" {
  type    = string
  default = "rootsacad2022-ih-wthr"
}

variable "iot_messages_name" {
  type    = string
  default = "iot-messages-store"
}

variable "iot_predictions_name" {
  type    = string
  default = "iot-predictions-store"
}

variable "iot_source" {
  type    = string
  default = "DeviceMessages"
}

variable "batch_frequency_in_seconds" {
  type    = number
  default = 300
}

variable "max_chunk_size_in_bytes" {
  type    = number
  default = 104857600
}