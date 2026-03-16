output "arn" {
  description = "The ARN of the anomaly detector."
  value       = module.cloudwatch_log-anomaly-detector.arn
}