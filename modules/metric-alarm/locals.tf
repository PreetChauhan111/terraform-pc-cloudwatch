locals {
  common_tags = {
    Environment = var.environment
    Owner       = "pc"
    GitHubRepo  = "pc-cloudwatch-wrapper"
  }
  local_name  = "${local.common_tags["Owner"]}-${var.environment}-${var.region}"
  alarm_name  = var.alarm_name == "" ? "${local.local_name}-alarm" : var.alarm_name
  metric_name = var.metric_name == "" ? "${local.local_name}-metric" : var.metric_name
  namespace   = var.namespace == "" ? "${local.local_name}-namespace" : var.namespace
  tags        = merge(local.common_tags, var.tags, { Name = local.alarm_name })
}
