module "cloudwatch_log-anomaly-detector" {
  source                  = "terraform-aws-modules/cloudwatch/aws//modules/log-anomaly-detector"
  version                 = "5.7.2"
  anomaly_visibility_time = var.anomaly_visibility_time
  create                  = var.create
  detector_name           = local.detector_name
  enabled                 = var.enabled
  evaluation_frequency    = var.evaluation_frequency
  filter_pattern          = var.filter_pattern
  kms_key_id              = var.kms_key_id
  log_group_arns          = var.log_group_arns
}
