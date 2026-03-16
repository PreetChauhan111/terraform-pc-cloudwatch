module "cloudwatch_metric-stream" {
  source                   = "terraform-aws-modules/cloudwatch/aws//modules/metric-stream"
  version                  = "5.7.2"
  create                   = var.create
  exclude_filter           = var.exclude_filter
  firehose_arn             = var.firehose_arn
  include_filter           = var.include_filter
  name                     = local.name
  name_prefix              = var.name_prefix
  output_format            = var.output_format
  role_arn                 = var.role_arn
  statistics_configuration = var.statistics_configuration
  tags                     = local.tags
}
