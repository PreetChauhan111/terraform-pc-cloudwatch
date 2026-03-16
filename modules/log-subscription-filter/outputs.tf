output "cloudwatch_log_subscription_filter_name" {
  description = "Log subscription filter name"
  value       = module.cloudwatch_log-subscription-filter.cloudwatch_log_subscription_filter_name
}