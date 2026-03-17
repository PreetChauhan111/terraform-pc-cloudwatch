# log-data-protection-policy

Wrapper module for AWS CloudWatch Logs data protection policies for a log group.

## Source

This wrapper uses the upstream module from `terraform-aws-modules/cloudwatch/aws` and adds local naming, tagging, and region/environment defaults used in this repository.

## Usage

```hcl
module "log_data_protection_policy" {
  source = "./modules/log-data-protection-policy"

  environment    = "dev"
  region         = "ap-south-1"
  log_group_name = "/aws/lambda/example"
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create` | Whether to create the cloudwatch log data protection policy. | `bool` | `true` |
| `create_log_data_protection_policy` | Whether to create the cloudwatch log data protection policy. | `bool` | `false` |
| `log_group_name` | The name of the log group under which the log stream is to be created. | `string` | `null` |
| `policy_document` | Specifies the data protection policy in JSON. | `string` | `null` |
| `log_data_protection_policy_name` | The name of the data protection policy document. | `string` | `null` |
| `log_data_protection_description` | The description of the data protection policy document. | `string` | `null` |
| `audit_statement_sid` | Name of the audit statement. | `string` | `"audit-policy"` |
| `deidentify_statement_sid` | Name of the deidentify statement. | `string` | `"redact-policy"` |
| `data_identifiers` | Set of at least 1 sensitive data identifiers that you want to mask. | `list(string)` | `null` |
| `findings_destination_cloudwatch_log_group` | Configures CloudWatch Logs as a findings destination. | `string` | `null` |
| `findings_destination_firehose_delivery_stream` | Configures Kinesis Firehose as a findings destination. | `string` | `null` |
| `findings_destination_s3_bucket` | Configures S3 as a findings destination. | `string` | `null` |
| `region` | - | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"dev"` |

## Outputs

| Name | Description |
|------|-------------|
| `log_group_name` | Name of Cloudwatch log group |

## Notes

- Default AWS region is `ap-south-1` unless overridden with `region`.
- Default deployment environment is `dev` unless overridden with `environment`.
- Most modules merge user-provided tags with repository-level common tags.
