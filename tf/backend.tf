terraform {
  backend "azurerm" {
    resource_group_name  = "rootsac2022q1edge"
    storage_account_name = "rootsac2022storage"
    container_name       = "tfstate"
  }
}