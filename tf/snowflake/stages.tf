resource "snowflake_stage" "snowstage" {
  provider    = snowflake.terraform
  name        = local.snowstage_name
  url         = "azure://rootsac22json${var.env}.blob.core.windows.net/json-blob-messages"
  database    = snowflake_database.main.name
  schema      = snowflake_schema.datawarehouse.name
  credentials = "${var.azure_sas_token}='${var.sas_token}'"
  file_format = "FORMAT_NAME = ${local.qualified_file_format_name}"
}

resource "snowflake_stage" "snowstage_sandbox" {
  provider    = snowflake.terraform
  name        = "${local.snowstage_pred_name}_SANDBOX"
  url         = "azure://rootsac22json.blob.core.windows.net/json-blob"
  database    = snowflake_database.main.name
  schema      = snowflake_schema.datawarehouse.name
  credentials = "${var.azure_sas_token}='${var.sas_token_sandbox_json}'"
  file_format = "FORMAT_NAME = ${local.qualified_file_format_name}"
}

resource "snowflake_stage" "snowstage_predictions" {
  provider    = snowflake.terraform
  name        = local.snowstage_pred_name
  url         = "azure://rootsac22json${var.env}.blob.core.windows.net/json-blob-predictions"
  database    = snowflake_database.main.name
  schema      = snowflake_schema.datawarehouse.name
  credentials = "${var.azure_sas_token}='${var.sas_token_predictions}'"
  file_format = "FORMAT_NAME = ${local.qualified_file_format_name}"
}

resource "snowflake_stage" "snowstage_predictions_sandbox" {
  provider    = snowflake.terraform
  name        = "${local.snowstage_pred_name}_SANDBOX"
  url         = "azure://rootsac22json.blob.core.windows.net/json-predictions"
  database    = snowflake_database.main.name
  schema      = snowflake_schema.datawarehouse.name
  credentials = "${var.azure_sas_token}='${var.sas_token_sandbox_pred}'"
  file_format = "FORMAT_NAME = ${local.qualified_file_format_name}"
}