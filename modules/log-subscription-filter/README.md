# log-subscription-filter

Wrapper module for AWS CloudWatch log subscription filters.

## Source

This wrapper uses the upstream module from `terraform-aws-modules/cloudwatch/aws` and adds local naming, tagging, and region/environment defaults used in this repository.

## Usage

```hcl
module "log_subscription_filter" {
  source = "./modules/log-subscription-filter"

  environment    = "dev"
  region         = "ap-south-1"
  name           = "ship-to-firehose"
  log_group_name = "/aws/lambda/example"
  destination_arn = "arn:aws:firehose:ap-south-1:123456789012:deliverystream/example"
  filter_pattern  = ""
  role_arn        = "arn:aws:iam::123456789012:role/cloudwatch-logs-subscription"
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create` | Whether to create the Cloudwatch log stream | `bool` | `true` |
| `name` | A name for the log stream | `string` | `null` |
| `destination_arn` | The ARN of the destination to deliver matching log events to. Kinesis stream or Lambda function ARN | `string` | `null` |
| `filter_pattern` | A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events. Use empty string to match everything | `string` | `""` |
| `log_group_name` | The name of the log group to associate the subscription filter with | `string` | `null` |
| `role_arn` | The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to deliver ingested log events to the destination | `string` | `null` |
| `distribution` | The method used to distribute log data to the destination. By default log data is grouped by log stream, but the grouping can be set to random for a more even distribution | `string` | `null` |
| `region` | AWS region | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"dev"` |

## Outputs

| Name | Description |
|------|-------------|
| `cloudwatch_log_subscription_filter_name` | Log subscription filter name |

## Notes

- Default AWS region is `ap-south-1` unless overridden with `region`.
- Default deployment environment is `dev` unless overridden with `environment`.
- Most modules merge user-provided tags with repository-level common tags.
