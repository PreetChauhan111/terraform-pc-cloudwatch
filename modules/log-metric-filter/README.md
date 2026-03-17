# log-metric-filter

Wrapper module for AWS CloudWatch log metric filters.

## Source

This wrapper uses the upstream module from `terraform-aws-modules/cloudwatch/aws` and adds local naming, tagging, and region/environment defaults used in this repository.

## Usage

```hcl
module "log_metric_filter" {
  source = "./modules/log-metric-filter"

  region                          = "ap-south-1"
  environment                     = "dev"
  name                            = "error-count"
  log_group_name                  = "/aws/lambda/example"
  pattern                         = "{ $.level = \"ERROR\" }"
  metric_transformation_name      = "ErrorCount"
  metric_transformation_namespace = "Application"
  metric_transformation_value     = "1"
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create_cloudwatch_log_metric_filter` | Whether to create the Cloudwatch log metric filter | `bool` | `true` |
| `name` | A name for the metric filter. | `string` | `n/a` |
| `pattern` | A valid CloudWatch Logs filter pattern for extracting metric data out of ingested log events. | `string` | `n/a` |
| `log_group_name` | The name of the log group to associate the metric filter with | `string` | `n/a` |
| `metric_transformation_name` | The name of the CloudWatch metric to which the monitored log information should be published (e.g. ErrorCount) | `string` | `n/a` |
| `metric_transformation_namespace` | The destination namespace of the CloudWatch metric. | `string` | `n/a` |
| `metric_transformation_value` | What to publish to the metric. For example, if you're counting the occurrences of a particular term like 'Error', the value will be '1' for each occurrence. If you're counting the bytes transferred the published value will be the value in the log event. | `string` | `"1"` |
| `metric_transformation_default_value` | The value to emit when a filter pattern does not match a log event. Conflicts with `metric_transformation_dimensions`. | `string` | `null` |
| `metric_transformation_unit` | The unit to assign to the metric. If you omit this, the unit is set as None. | `string` | `null` |
| `metric_transformation_dimensions` | The additional dimensions to assign to the metric, in the form `\ | `map(string)` | `{}` |
| `region` | AWS region | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"dev"` |

## Outputs

| Name | Description |
|------|-------------|
| `cloudwatch_log_metric_filter_id` | The name of the metric filter |

## Notes

- Default AWS region is `ap-south-1` unless overridden with `region`.
- Default deployment environment is `dev` unless overridden with `environment`.
- Most modules merge user-provided tags with repository-level common tags.
