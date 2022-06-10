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
}