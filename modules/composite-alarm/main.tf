module "cloudwatch_composite-alarm" {
  source                    = "terraform-aws-modules/cloudwatch/aws//modules/composite-alarm"
  version                   = "5.7.2"
  actions_enabled           = var.actions_enabled
  actions_suppressor        = var.actions_suppressor
  alarm_actions             = var.alarm_actions
  alarm_description         = var.alarm_description
  alarm_name                = var.alarm_name
  alarm_rule                = var.alarm_rule
  create                    = var.create
  insufficient_data_actions = var.insufficient_data_actions
  ok_actions                = var.ok_actions
  tags                      = var.tags
}
