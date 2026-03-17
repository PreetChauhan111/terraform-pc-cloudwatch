# log-group

Wrapper module for AWS CloudWatch log groups.

## Source

This wrapper uses the upstream module from `terraform-aws-modules/cloudwatch/aws` and adds local naming, tagging, and region/environment defaults used in this repository.

## Usage

```hcl
module "log_group" {
  source = "./modules/log-group"

  environment       = "dev"
  region            = "ap-south-1"
  name              = "/aws/lambda/example"
  retention_in_days = 30
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create` | Whether to create the Cloudwatch log group | `bool` | `true` |
| `name` | A name for the log group | `string` | `null` |
| `name_prefix` | A name prefix for the log group | `string` | `null` |
| `retention_in_days` | Specifies the number of days you want to retain log events in the specified log group. Possible values are: 0, 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288 and 3653. | `number` | `null` |
| `kms_key_id` | The ARN of the KMS Key to use when encrypting logs | `string` | `null` |
| `log_group_class` | Specified the log class of the log group. Possible values are: STANDARD or INFREQUENT_ACCESS | `string` | `null` |
| `skip_destroy` | Set to true if you do not wish the log group (and any logs it may contain) to be deleted at destroy time, and instead just remove the log group from the Terraform state | `bool` | `null` |
| `tags` | A map of tags to add to Cloudwatch log group | `map(string)` | `{}` |
| `region` | AWS region | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"dev"` |

## Outputs

| Name | Description |
|------|-------------|
| `cloudwatch_log_group_name` | Name of Cloudwatch log group |
| `cloudwatch_log_group_arn` | ARN of Cloudwatch log group |

## Notes

- Default AWS region is `ap-south-1` unless overridden with `region`.
- Default deployment environment is `dev` unless overridden with `environment`.
- Most modules merge user-provided tags with repository-level common tags.
