# metric-stream

Wrapper module for AWS CloudWatch metric streams.

## Source

This wrapper uses the upstream module from `terraform-aws-modules/cloudwatch/aws` and adds local naming, tagging, and region/environment defaults used in this repository.

## Usage

```hcl
module "metric_stream" {
  source = "./modules/metric-stream"

  environment   = "dev"
  region        = "ap-south-1"
  name          = "pc-dev-metric-stream"
  firehose_arn  = "arn:aws:firehose:ap-south-1:123456789012:deliverystream/example"
  role_arn      = "arn:aws:iam::123456789012:role/cloudwatch-metric-stream-role"
  output_format = "json"
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create` | Whether to create the Cloudwatch metric stream. | `bool` | `true` |
| `name` | Friendly name of the metric stream. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix. | `string` | `null` |
| `name_prefix` | Creates a unique friendly name beginning with the specified prefix. Conflicts with name. | `string` | `null` |
| `firehose_arn` | ARN of the Amazon Kinesis Firehose delivery stream to use for this metric stream. | `string` | `n/a` |
| `role_arn` | ARN of the IAM role that this metric stream will use to access Amazon Kinesis Firehose resources. | `string` | `n/a` |
| `output_format` |  Output format for the stream. Possible values are json, opentelemetry0.7, and opentelemetry1.0 | `string` | `n/a` |
| `exclude_filter` | Map of exclusive metric filters. If you specify this parameter, the stream sends metrics from all metric namespaces except for the namespaces and the conditional metric names that you specify here. If you don't specify metric names or provide empty metric names whole metric namespace is excluded. Conflicts with include_filter. | `any` | `{}` |
| `include_filter` | Map of inclusive metric filters. If you specify this parameter, the stream sends only the conditional metric names from the metric namespaces that you specify here. If you don't specify metric names or provide empty metric names whole metric namespace is included. Conflicts with exclude_filter. | `any` | `{}` |
| `statistics_configuration` | Map of statistics configuration. | `any` | `[]` |
| `tags` | A map of tags to add to the Cloudwatch Metric Stream. | `map(string)` | `{}` |
| `region` | AWS region | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"dev"` |

## Outputs

| Name | Description |
|------|-------------|
| `cloudwatch_metric_stream` | ARN of the metric stream. |
| `cloudwatch_metric_stream_creation_date` | Date and time in RFC3339 format that the metric stream was created. |
| `cloudwatch_metric_stream_last_update_date` | Date and time in RFC3339 format that the metric stream was last updated. |
| `cloudwatch_metric_stream_state` | State of the metric stream. Possible values are running and stopped. |

## Notes

- Default AWS region is `ap-south-1` unless overridden with `region`.
- Default deployment environment is `dev` unless overridden with `environment`.
- Most modules merge user-provided tags with repository-level common tags.
