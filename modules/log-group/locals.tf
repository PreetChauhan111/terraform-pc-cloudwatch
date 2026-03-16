locals {
  common_tags = {
    Environment = var.environment
    Owner       = "pc"
    GitHubRepo  = "pc-cloudwatch-wrapper"
  }
  local_name = "${local.common_tags["Owner"]}-${var.environment}-${var.region}"
  name       = var.name == "" ? "${local.local_name}-log-group" : var.name
  tags       = merge(local.common_tags, var.tags, { Name = local.name })
}