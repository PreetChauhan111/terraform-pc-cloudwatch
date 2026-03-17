# cis-alarms

Wrapper module for AWS CloudWatch CIS benchmark metric filters and alarms.

## Source

This wrapper uses the upstream module from `terraform-aws-modules/cloudwatch/aws` and adds local naming, tagging, and region/environment defaults used in this repository.

## Usage

```hcl
module "cis_alarms" {
  source = "./modules/cis-alarms"

  environment    = "dev"
  region         = "ap-south-1"
  alarm_actions  = ["arn:aws:sns:ap-south-1:123456789012:alerts"]
  ok_actions     = ["arn:aws:sns:ap-south-1:123456789012:alerts"]
  log_group_name = "/aws/cloudtrail/organization"
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create` | Whether to create the Cloudwatch log metric filter and metric alarms | `bool` | `true` |
| `use_random_name_prefix` | Whether to prefix resource names with random prefix | `bool` | `false` |
| `name_prefix` | A name prefix for the cloudwatch alarm (if use_random_name_prefix is true, this will be ignored) | `string` | `""` |
| `control_overrides` | A map of overrides to apply to each control | `any` | `{}` |
| `disabled_controls` | List of IDs of disabled CIS controls | `list(string)` | `[]` |
| `namespace` | The namespace where metric filter and metric alarm should be cleated | `string` | `"CISBenchmark"` |
| `log_group_name` | The name of the log group to associate the metric filter with | `string` | `""` |
| `alarm_actions` | List of ARNs to put as Cloudwatch Alarms actions (eg, ARN of SNS topic) | `list(string)` | `[]` |
| `actions_enabled` | Indicates whether or not actions should be executed during any changes to the alarm's state. | `bool` | `true` |
| `tags` | A mapping of tags to assign to all resources | `map(string)` | `{}` |
| `ok_actions` | List of ARNs to put as Cloudwatch OK actions (eg, ARN of SNS topic) | `list(string)` | `[]` |
| `insufficient_data_actions` | List of ARNs to put as Cloudwatch insuficient data actions (eg, ARN of SNS topic) | `list(string)` | `[]` |
| `region` | AWS Region | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"dev"` |

## Outputs

| Name | Description |
|------|-------------|
| `cloudwatch_metric_alarm_arns` | List of ARNs of the Cloudwatch metric alarm |
| `cloudwatch_metric_alarm_ids` | List of IDs of the Cloudwatch metric alarm |

## Notes

- Default AWS region is `ap-south-1` unless overridden with `region`.
- Default deployment environment is `dev` unless overridden with `environment`.
- Most modules merge user-provided tags with repository-level common tags.
