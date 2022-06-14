terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraformingsnowflake"
    storage_account_name = "rootsac2022storage"
    container_name       = "tfstate"
  }
}