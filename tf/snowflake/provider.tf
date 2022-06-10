provider "snowflake" {
  features {}
  alias = var.snowflake_alias
  role  = var.snowflake_role
}