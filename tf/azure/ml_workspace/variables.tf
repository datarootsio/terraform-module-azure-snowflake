variable "env" {
  description = "Environment for resources"
  type        = string
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "application_insights_prefix" {
  type    = string
  default = "rootsacad2022appins"
}

variable "application_insights_type" {
  type    = string
  default = "web"
}

variable "container_registry_prefix" {
  type    = string
  default = "rootsacad2022cr"
}

variable "key_vault_prefix" {
  type    = string
  default = "rootsacad2022kv"
}

variable "sku_standard" {
  type    = string
  default = "standard"
}

variable "ml_workspace_prefix" {
  type    = string
  default = "rootsacad2022-azure-ml"
}

variable "ml_identity_type" {
  type    = string
  default = "SystemAssigned"
}

variable "storage_account_prefix" {
  type    = string
  default = "rootsacad2022sa"
}

variable "storage_account_tier" {
  type    = string
  default = "Standard"
}

variable "storage_account_repl" {
  type    = string
  default = "GRS"
}