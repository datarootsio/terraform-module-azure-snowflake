terraform {
  required_version = ">= 1.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "~> 0.31.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraformingsnowflake"
    storage_account_name = "rootsac2022storage"
    container_name       = "tfstate"
  }
}


data "azurerm_client_config" "current" {}


provider "azurerm" {
  features {}
}

provider "snowflake" {
  features {}
  alias = "terraform"
  role  = "ACCOUNTADMIN"
}
