variable "env" {
  description = "Environment for resources"
  type        = string
  validation {
    condition     = contains(["staging", "prod"], var.env)
    error_message = "Environment should be either: staging or prod."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group containg the state"
  type        = string
  default     = "rg-terraformingsnowflake"
}

variable "storage_account_name" {
  description = "Name of the storage account containg the state"
  type        = string
  default     = "rootsac2022storage"
}

variable "container_name" {
  description = "Name of the container"
  type        = string
  default     = "tfstate"
}

variable "snowflake_alias" {
  description = "Alias of the terraform provider"
  type        = string
  default     = "terraform"
}

variable "snowflake_role" {
  description = "Role used to manage the Snowflake resources"
  type        = string
  default     = "ACCOUNTADMIN"
}