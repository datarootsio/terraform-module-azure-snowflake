locals {
  env_upper = upper(var.env)

  qualified_stage_name             = "${snowflake_stage.snowstage.database}.${snowflake_stage.snowstage.schema}.${snowflake_stage.snowstage.name}"
  qualified_sensor_table_name      = "${snowflake_table.sensor.database}.${snowflake_table.sensor.schema}.${snowflake_table.sensor.name}"
  qualified_file_format_name       = "${snowflake_database.main.name}.${snowflake_schema.datawarehouse.name}.${snowflake_file_format.json.name}"
  qualified_predictions_table_name = "${snowflake_table.predictions.database}.${snowflake_table.predictions.schema}.${snowflake_table.predictions.name}"
  qualified_stage_predictions_name = "${snowflake_stage.snowstage_predictions.database}.${snowflake_stage.snowstage_predictions.schema}.${snowflake_stage.snowstage_predictions.name}"

  qualified_stage_name_sandbox             = "${snowflake_stage.snowstage_sandbox.database}.${snowflake_stage.snowstage_sandbox.schema}.${snowflake_stage.snowstage_sandbox.name}"
  qualified_stage_predictions_name_sandbox = "${snowflake_stage.snowstage_predictions.database}.${snowflake_stage.snowstage_predictions.schema}.${snowflake_stage.snowstage_predictions.name}"

  file_format_name              = "${file_format_prefix}_${env_upper}"
  storage_integration_name      = "${storage_integration_prefix}_${env_upper}"
  notification_integration_name = "${notification_integration_prefix}_${env_upper}"

  snowflake_pipe_name      = "${var.pipe_prefix}_${env_upper}"
  snowflake_pipe_pred_name = "${var.pipe_pred_prefix}_${env_upper}"

  snowstage_name      = "${var.stage_prefix}_${env_upper}"
  snowstage_pred_name = "${var.stage_pred_prefix}_${env_upper}"

  table_json_name = "${var.table_prefix}_JSON_${env_upper}"
  table_pred_name = "${var.table_prefix}_PREDICTIONS_${env_upper}"
}
