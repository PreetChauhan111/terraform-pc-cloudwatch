module "cloudwatch_log-metric-filter" {
  source                              = "terraform-aws-modules/cloudwatch/aws//modules/log-metric-filter"
  version                             = "5.7.2"
  create_cloudwatch_log_metric_filter = var.create_cloudwatch_log_metric_filter
  log_group_name                      = local.log_group_name
  metric_transformation_default_value = var.metric_transformation_default_value
  metric_transformation_dimensions    = var.metric_transformation_dimensions
  metric_transformation_name          = local.metric_transformation_name
  metric_transformation_namespace     = local.metric_transformation_namespace
  metric_transformation_unit          = var.metric_transformation_unit
  metric_transformation_value         = var.metric_transformation_value
  name                                = local.name
  pattern                             = var.pattern
}
