module "iot_hub" {
  source = "./iot_hub"
  env    = var.env
}

module "ml_workspace" {
  source = "./ml_workspace"
  env    = var.env
}