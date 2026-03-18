module "cloudwatch_log-subscription-filter" {
  source          = "terraform-aws-modules/cloudwatch/aws//modules/log-subscription-filter"
  version         = "5.7.2"
  create          = var.create
  destination_arn = var.destination_arn
  distribution    = var.distribution
  filter_pattern  = var.filter_pattern
  log_group_name  = var.log_group_name
  name            = var.name
  role_arn        = var.role_arn
}
