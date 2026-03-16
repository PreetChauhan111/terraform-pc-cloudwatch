locals {
  common_tags = {
    Environment = var.environment
    Owner       = "pc"
    GitHubRepo  = "pc-cloudwatch-wrapper"
  }
  local_name = "${local.common_tags["Owner"]}-${var.environment}-${var.region}"
  name       = var.name == "" ? "${local.local_name}-query-definition" : var.name
}
