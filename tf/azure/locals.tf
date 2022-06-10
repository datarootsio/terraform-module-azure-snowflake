locals {
  event_subscription_name = "${var.evst}-${var.env}"
  resource_group_name     = "${var.resource_group_prefix}-${var.env}"
}