resource "snowflake_pipe" "snowpipe" {
  provider = snowflake.terraform
  database = snowflake_database.main.name
  schema   = snowflake_schema.datawarehouse.name
  name     = local.snowflake_pipe_name

  copy_statement = "copy into ${local.qualified_sensor_table_name} from @${local.qualified_stage_name} file_format = (format_name = ${local.qualified_file_format_name})"
  auto_ingest    = true
  integration    = snowflake_notification_integration.azure_queue.name
}


resource "snowflake_pipe" "snowpipe_predictions" {
  provider = snowflake.terraform
  database = snowflake_database.main.name
  schema   = snowflake_schema.datawarehouse.name
  name     = local.snowflake_pipe_pred_name

  copy_statement = "copy into ${local.qualified_predictions_table_name} from @${local.qualified_stage_predictions_name} file_format = (format_name = ${local.qualified_file_format_name})"
  auto_ingest    = true
  integration    = snowflake_notification_integration.azure_queue.name
}

resource "snowflake_pipe_grant" "pipeadmin" {
  provider      = snowflake.terraform
  database_name = snowflake_database.main.name
  schema_name   = snowflake_schema.datawarehouse.name
  pipe_name     = snowflake_pipe.snowpipe.name

  privilege = var.pipe_priviledge_ownership
  roles     = [var.snowflake_role]
}
