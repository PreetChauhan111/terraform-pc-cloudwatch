locals {
  common_tags = {
    Environment = var.environment
    Owner       = "pc"
    GitHubRepo  = "pc-cloudwatch-wrapper"
  }
  local_name    = "${local.common_tags["Owner"]}-${var.environment}-${var.region}"
  detector_name = var.detector_name == "" ? "${local.local_name}-anomaly-detector" : var.detector_name
}
