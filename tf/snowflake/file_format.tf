resource "snowflake_file_format" "json" {
  provider             = snowflake.terraform
  name                 = locals.file_format_name
  database             = snowflake_database.main.name
  schema               = snowflake_schema.datawarehouse.name
  format_type          = "JSON"
  strip_outer_array    = true
  compression          = "NONE"
  binary_format        = "HEX"
  date_format          = "AUTO"
  time_format          = "AUTO"
  timestamp_format     = "AUTO"
  skip_byte_order_mark = true
}