# Dependent resources for Azure Machine Learning
resource "azurerm_application_insights" "as" {
  name                = "rootsacad2022appins-${var.env}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}

resource "azurerm_key_vault" "kv" {
  name                     = "rootsacad2022kv${var.env}"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = "standard"
  purge_protection_enabled = false
}

resource "azurerm_storage_account" "sa-ml" {
  name                     = "rootsacad2022sa${var.env}"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_container_registry" "cr" {
  name                = "rootsacad2022cr${var.env}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "standard"
  admin_enabled       = true
}

# Machine Learning workspace
resource "azurerm_machine_learning_workspace" "amlw" {
  name                    = "rootsacad2022-azure-ml-${var.env}"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  application_insights_id = azurerm_application_insights.as.id
  key_vault_id            = azurerm_key_vault.kv.id
  storage_account_id      = azurerm_storage_account.iothubstorage.id

  identity {
    type = "SystemAssigned"
  }
}