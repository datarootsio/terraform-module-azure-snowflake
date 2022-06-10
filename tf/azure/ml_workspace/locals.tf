locals {
  application_insights_name = "${var.application_insights_prefix}-${var.env}"
  container_registry_name   = "${var.container_registry_prefix}-${var.env}"
  key_vault_name            = "${var.key_vault_prefix}-${var.env}"
  ml_workspace_name         = "${var.ml_workspace_prefix}-${var.env}"
  storage_acc_name          = "${var.storage_account_prefix}-${var.env}"
}