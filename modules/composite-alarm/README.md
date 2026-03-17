# composite-alarm

Wrapper module for AWS CloudWatch composite alarms.

## Source

This wrapper uses the upstream module from `terraform-aws-modules/cloudwatch/aws` and adds local naming, tagging, and region/environment defaults used in this repository.

## Usage

```hcl
module "composite_alarm" {
  source = "./modules/composite-alarm"

  environment       = "dev"
  region            = "ap-south-1"
  alarm_name        = "pc-dev-health-alarm"
  alarm_description = "Triggers when either CPU or memory alarm is active"
  alarm_rule        = "ALARM(\"cpu-alarm\") OR ALARM(\"memory-alarm\")"
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create` | Whether to create the Cloudwatch composite alarm | `bool` | `true` |
| `alarm_name` | The descriptive name for the composite alarm. This name must be unique within the region. | `string` | `null` |
| `alarm_description` | The description for the composite alarm. | `string` | `null` |
| `actions_enabled` | Indicates whether or not actions should be executed during any changes to the composite alarm's state. Defaults to true. | `bool` | `true` |
| `actions_suppressor` | A map of actions suppressor alarm configurations. | `map(any)` | `{}` |
| `alarm_actions` | The set of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN). Up to 5 actions are allowed. | `list(string)` | `null` |
| `insufficient_data_actions` | The set of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN). Up to 5 actions are allowed. | `list(string)` | `null` |
| `ok_actions` | The set of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN). Up to 5 actions are allowed. | `list(string)` | `null` |
| `alarm_rule` | An expression that specifies which other alarms are to be evaluated to determine this composite alarm's state. The maximum length is 10240 characters. | `string` | `null` |
| `tags` | A mapping of tags to assign to all resources | `map(string)` | `{}` |
| `region` | AWS Region | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"dev"` |

## Outputs

| Name | Description |
|------|-------------|
| `cloudwatch_composite_alarm_arn` | The ARN of the Cloudwatch composite alarm. |
| `cloudwatch_composite_alarm_id` | The ID of the Cloudwatch composite alarm. |

## Notes

- Default AWS region is `ap-south-1` unless overridden with `region`.
- Default deployment environment is `dev` unless overridden with `environment`.
- Most modules merge user-provided tags with repository-level common tags.
