data "azurerm_client_config" "current" {}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rootsac2022q1edge-${var.env}"
  location = var.location

  tags = {
    managed-by  = "Terraform"
    environment = var.env
    customer    = "dataroots"
    contact     = "lidia@dataroots.io"
  }
}