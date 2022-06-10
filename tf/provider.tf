provider "azurerm" {
  features {}
}

provider "snowflake" {
  features {}
  alias = "terraform"
  role  = "ACCOUNTADMIN"
}