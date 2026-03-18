module "cloudwatch_cis-alarms" {
  source                    = "terraform-aws-modules/cloudwatch/aws//modules/cis-alarms"
  version                   = "5.7.2"
  actions_enabled           = var.actions_enabled
  alarm_actions             = var.alarm_actions
  control_overrides         = var.control_overrides
  create                    = var.create
  disabled_controls         = var.disabled_controls
  insufficient_data_actions = var.insufficient_data_actions
  log_group_name            = var.log_group_name
  name_prefix               = var.name_prefix
  namespace                 = var.namespace
  ok_actions                = var.ok_actions
  tags                      = var.tags
  use_random_name_prefix    = var.use_random_name_prefix
}
