variable "resource_group_name" {
  description = "Name of the resource group containg the state"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account containg the state"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
  default     = "tfstate"
}

variable "snowflake_alias" {
  description = "Alias of the terraform provider"
  type        = string
}

variable "snowflake_role" {
  description = "Role used to manage the Snowflake resources"
  type        = string
  default     = "ACCOUNTADMIN"
}