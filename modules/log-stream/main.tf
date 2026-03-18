module "cloudwatch_log-stream" {
  source         = "terraform-aws-modules/cloudwatch/aws//modules/log-stream"
  version        = "5.7.2"
  create         = var.create
  log_group_name = var.log_group_name
  name           = var.name
}
