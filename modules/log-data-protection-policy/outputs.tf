output "log_group_name" {
  description = "Name of Cloudwatch log group"
  value       = module.cloudwatch_log-data-protection-policy.log_group_name
}