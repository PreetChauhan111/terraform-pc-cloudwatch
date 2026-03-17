# metric-alarm

Wrapper module for AWS CloudWatch metric alarms.

## Source

This wrapper uses the upstream module from `terraform-aws-modules/cloudwatch/aws` and adds local naming, tagging, and region/environment defaults used in this repository.

## Usage

```hcl
module "metric_alarm" {
  source = "./modules/metric-alarm"

  environment         = "dev"
  region              = "ap-south-1"
  alarm_name          = "pc-dev-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  threshold           = 80
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create_metric_alarm` | Whether to create the Cloudwatch metric alarm | `bool` | `true` |
| `alarm_name` | The descriptive name for the alarm. This name must be unique within the user's AWS account. | `string` | `n/a` |
| `alarm_description` | The description for the alarm. | `string` | `null` |
| `comparison_operator` | The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. | `string` | `n/a` |
| `evaluation_periods` | The number of periods over which data is compared to the specified threshold. | `number` | `n/a` |
| `threshold` | The value against which the specified statistic is compared. | `number` | `null` |
| `threshold_metric_id` | If this is an alarm based on an anomaly detection model, make this value match the ID of the ANOMALY_DETECTION_BAND function. | `string` | `null` |
| `unit` | The unit for the alarm's associated metric. | `string` | `null` |
| `metric_name` | The name for the alarm's associated metric. See docs for supported metrics. | `string` | `null` |
| `namespace` | The namespace for the alarm's associated metric. See docs for the list of namespaces. See docs for supported metrics. | `string` | `null` |
| `period` | The period in seconds over which the specified statistic is applied. | `string` | `null` |
| `statistic` | The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum | `string` | `null` |
| `actions_enabled` | Indicates whether or not actions should be executed during any changes to the alarm's state. Defaults to true. | `bool` | `true` |
| `datapoints_to_alarm` | The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` |
| `dimensions` | The dimensions for the alarm's associated metric. | `any` | `null` |
| `alarm_actions` | The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN). | `list(string)` | `null` |
| `insufficient_data_actions` | The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN). | `list(string)` | `null` |
| `ok_actions` | The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN). | `list(string)` | `null` |
| `extended_statistic` | The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100. | `string` | `null` |
| `treat_missing_data` | Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. | `string` | `"missing"` |
| `evaluate_low_sample_count_percentiles` | Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. The following values are supported: ignore, and evaluate. | `string` | `null` |
| `metric_query` | Enables you to create an alarm based on a metric math expression. You may specify at most 20. | `any` | `[]` |
| `tags` | A mapping of tags to assign to all resources | `map(string)` | `{}` |
| `region` | AWS region | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"dev"` |

## Outputs

| Name | Description |
|------|-------------|
| `cloudwatch_metric_alarm_arn` | The ARN of the Cloudwatch metric alarm. |
| `cloudwatch_metric_alarm_id` | The ID of the Cloudwatch metric alarm. |

## Notes

- Default AWS region is `ap-south-1` unless overridden with `region`.
- Default deployment environment is `dev` unless overridden with `environment`.
- Most modules merge user-provided tags with repository-level common tags.
