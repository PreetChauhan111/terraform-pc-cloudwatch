locals {
  common_tags = {
    Environment = var.environment
    Owner       = "pc"
    GitHubRepo  = "pc-cloudwatch-wrapper"
  }
  local_name     = "${local.common_tags["Owner"]}-${var.environment}-${var.region}"
  name_prefix    = var.name_prefix == "" ? "${local.local_name}-alarm" : var.name_prefix
  log_group_name = var.log_group_name == "" ? "${local.local_name}-log-group" : var.log_group_name
  tags           = merge(local.common_tags, var.tags, { Name = local.name_prefix })
}
