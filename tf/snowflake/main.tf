terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "~> 0.31.0"
    }
  }
}

provider "snowflake" {
  features {}
  alias = var.snowflake_alias
  role  = var.snowflake_role
}


resource "snowflake_database" "main" {
  provider = snowflake.terraform
  name     = "WEATHER_${local.env_upper}"
}

resource "snowflake_warehouse" "weather" {
  provider       = snowflake.terraform
  name           = "WEATHER_WHS_${local.env_upper}"
  warehouse_size = "xsmall"
  auto_suspend   = 60
}

resource "snowflake_schema" "datawarehouse" {
  provider   = snowflake.terraform
  database   = snowflake_database.main.name
  name       = "DATAWAREHOUSE_${local.env_upper}"
  is_managed = false
}
