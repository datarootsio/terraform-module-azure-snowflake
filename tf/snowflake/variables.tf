variable "env" {
  description = "Environment for resources"
  type        = string
  validation {
    condition     = contains(["staging", "prod"], var.env)
    error_message = "Environment should be either: staging, or prod."
  }
}

variable "sas_token" {
  type = string
}

variable "sas_token_predictions" {
  type = string
}

variable "sas_token_sandbox_json" {
  type = string
}

variable "sas_token_sandbox_pred" {
  type = string
}

variable "snowflake_alias" {
  description = "Alias of the terraform provider"
  type        = string
  default     = "terraform"
}

variable "snowflake_role" {
  description = "Role used to manage the Snowflake resources"
  type        = string
  default     = "ACCOUNTADMIN"
}

variable "pipe_priviledge_ownership" {
  type    = string
  default = "OWNERSHIP"
}

variable "file_format_prefix" {
  type    = string
  default = "JSON_DQ"
}

variable "external_stage" {
  type    = string
  default = "EXTERNAL_STAGE"
}

variable "storage_provider" {
  type    = string
  default = "AZURE"
}

variable "storage_integration_prefix" {
  type    = string
  default = "AZURE_INTEGRATION"
}

variable "notification_integration_prefix" {
  type    = string
  default = "WEATHER_NOTIFICATION"
}

variable "notification_integration_type" {
  type    = string
  default = "QUEUE"
}

variable "notification_integration_provider" {
  type    = string
  default = "AZURE_STORAGE_QUEUE"
}

variable "pipe_prefix" {
  type    = string
  default = "WEATHER_PIPE_DQ"
}

variable "pipe_pred_prefix" {
  type    = string
  default = "WEATHER_PIPE_PRED_DQ"
}

variable "stage_prefix" {
  type    = string
  default = "SNOWPIPE_STAGE"
}

variable "stage_pred_prefix" {
  type    = string
  default = "SNOWPIPE_STAGE_PREDICTIONS"
}

variable "azure_sas_token" {
  type    = string
  default = "AZURE_SAS_TOKEN"
}

variable "table_prefix" {
  type    = string
  default = "WEATHER"
}