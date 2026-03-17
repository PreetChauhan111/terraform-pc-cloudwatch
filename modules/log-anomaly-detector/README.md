# log-anomaly-detector

Wrapper module for AWS CloudWatch Logs anomaly detectors.

## Source

This wrapper uses the upstream module from `terraform-aws-modules/cloudwatch/aws` and adds local naming, tagging, and region/environment defaults used in this repository.

## Usage

```hcl
module "log_anomaly_detector" {
  source = "./modules/log-anomaly-detector"

  environment     = "dev"
  region          = "ap-south-1"
  detector_name   = "pc-dev-detector"
  log_group_arns  = ["arn:aws:logs:ap-south-1:123456789012:log-group:/aws/lambda/example:*"]
  enabled         = true
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create` | Whether to create the anomaly detector. | `bool` | `true` |
| `log_group_arns` | Array containing the ARN of the log group that this anomaly detector will watch. You can specify only one log group ARN. | `list(string)` | `null` |
| `anomaly_visibility_time` | Number of days to have visibility on an anomaly. After this time period has elapsed for an anomaly, it will be automatically baselined and the anomaly detector will treat new occurrences of a similar anomaly as normal. Therefore, if you do not correct the cause of an anomaly during the time period specified in anomaly_visibility_time, it will be considered normal going forward and will not be detected as an anomaly. Valid Range: Minimum value of 7. Maximum value of 90. | `number` | `null` |
| `detector_name` | Name for this anomaly detector. | `string` | `null` |
| `enabled` | Whether or not to enable the anomaly detector. | `bool` | `null` |
| `evaluation_frequency` | Specifies how often the anomaly detector is to run and look for anomalies. Set this value according to the frequency that the log group receives new logs. For example, if the log group receives new log events every 10 minutes, then 15 minutes might be a good setting for evaluation_frequency. Valid Values: ONE_MIN | FIVE_MIN | TEN_MIN | FIFTEEN_MIN | THIRTY_MIN | ONE_HOUR. | `string` | `null` |
| `filter_pattern` | You can use this parameter to limit the anomaly detection model to examine only log events that match the pattern you specify here. | `string` | `null` |
| `kms_key_id` | Optionally assigns a AWS KMS key to secure this anomaly detector and its findings. If a key is assigned, the anomalies found and the model used by this detector are encrypted at rest with the key. If a key is assigned to an anomaly detector, a user must have permissions for both this key and for the anomaly detector to retrieve information about the anomalies that it finds. | `string` | `null` |
| `region` | - | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"dev"` |

## Outputs

| Name | Description |
|------|-------------|
| `arn` | The ARN of the anomaly detector. |

## Notes

- Default AWS region is `ap-south-1` unless overridden with `region`.
- Default deployment environment is `dev` unless overridden with `environment`.
- Most modules merge user-provided tags with repository-level common tags.
