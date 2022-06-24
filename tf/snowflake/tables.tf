# resource "snowflake_table" "sensor" {
#   provider = snowflake.terraform
#   database = snowflake_database.main.name
#   schema   = snowflake_schema.datawarehouse.name
#   name     = local.table_json_name
#   column {
#     name    = "var"
#     type    = "VARIANT"
#     comment = "sensor data"
#   }
# }

# resource "snowflake_table" "predictions" {
#   provider = snowflake.terraform
#   database = snowflake_database.main.name
#   schema   = snowflake_schema.datawarehouse.name
#   name     = local.table_pred_name
#   column {
#     name    = "var"
#     type    = "VARIANT"
#     comment = "raw predicted data"
#   }
# }
