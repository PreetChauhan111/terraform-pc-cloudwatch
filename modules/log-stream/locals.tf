locals {
  common_tags = {
    Environment = var.environment
    Owner       = "pc"
    GitHubRepo  = "pc-cloudwatch-wrapper"
  }
  local_name     = "${local.common_tags["Owner"]}-${var.environment}-${var.region}"
  name           = var.name == "" ? "${local.local_name}-log-stream" : var.name
  log_group_name = var.log_group_name == "" ? "${local.local_name}-log-group" : var.log_group_name
}
