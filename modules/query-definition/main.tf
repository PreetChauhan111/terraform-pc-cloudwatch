module "cloudwatch_query-definition" {
  source          = "terraform-aws-modules/cloudwatch/aws//modules/query-definition"
  version         = "5.7.2"
  create          = var.create
  log_group_names = var.log_group_names
  name            = var.name
  query_string    = var.query_string
}
