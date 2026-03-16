locals {
  common_tags = {
    Environment = var.environment
    Owner       = "pc"
    GitHubRepo  = "pc-cloudwatch-wrapper"
  }
  local_name                      = "${local.common_tags["Owner"]}-${var.environment}-${var.region}"
  log_group_name                  = var.log_group_name == "" ? "${local.local_name}-log-group" : var.log_group_name
  log_data_protection_policy_name = var.log_data_protection_policy_name == "" ? "${local.local_name}-log-data-protection-policy" : var.log_data_protection_policy_name
}
