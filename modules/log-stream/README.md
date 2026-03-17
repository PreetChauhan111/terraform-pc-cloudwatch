# log-stream

Wrapper module for AWS CloudWatch log streams.

## Source

This wrapper uses the upstream module from `terraform-aws-modules/cloudwatch/aws` and adds local naming, tagging, and region/environment defaults used in this repository.

## Usage

```hcl
module "log_stream" {
  source = "./modules/log-stream"

  environment    = "dev"
  region         = "ap-south-1"
  name           = "application-stream"
  log_group_name = "/aws/lambda/example"
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create` | Whether to create the Cloudwatch log stream | `bool` | `true` |
| `name` | A name for the log stream | `string` | `null` |
| `log_group_name` | A name of the log group | `string` | `null` |
| `region` | AWS region | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"dev"` |

## Outputs

| Name | Description |
|------|-------------|
| `cloudwatch_log_stream_name` | Name of Cloudwatch log stream |
| `cloudwatch_log_stream_arn` | ARN of Cloudwatch log stream |

## Notes

- Default AWS region is `ap-south-1` unless overridden with `region`.
- Default deployment environment is `dev` unless overridden with `environment`.
- Most modules merge user-provided tags with repository-level common tags.
