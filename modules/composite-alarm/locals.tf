locals {
  common_tags = {
    Environment = var.environment
    Owner       = "pc"
    GitHubRepo  = "pc-cloudwatch-wrapper"
  }
  common_name = "${local.common_tags["Owner"]}-${var.environment}-${var.region}"
  alarm_name  = var.alarm_name == "" ? "${local.common_name}-alarm" : var.alarm_name
  tags        = merge(local.common_tags, var.tags, { Name = local.alarm_name })
}
