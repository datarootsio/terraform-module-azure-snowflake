module "azure" {
  source = "./azure"
  env    = var.env
}

module "snowflake" {
  source = "./snowflake"
  env    = var.env

  snowflake_alias = var.snowflake_alias
  snowflake_role  = var.snowflake_role

  sas_token             = module.azure.snowflake_sas_token
  sas_token_predictions = module.azure.snowflake_sas_token_predictions
}