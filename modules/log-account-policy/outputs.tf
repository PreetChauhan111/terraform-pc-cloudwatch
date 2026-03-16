output "log_account_policy_name" {
  description = "Name of Cloudwatch log account policy"
  value       = module.cloudwatch_log-account-policy.log_account_policy_name
}