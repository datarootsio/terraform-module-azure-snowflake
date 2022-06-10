variable "env" {
  description = "Environment for resources"
  type        = string
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "managed_tag" {
  type    = string
  default = "Terraform"
}

variable "resource_group_prefix" {
  type    = string
  default = "rootsac2022q1edge"
}