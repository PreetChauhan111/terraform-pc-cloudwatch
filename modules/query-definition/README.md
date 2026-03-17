# query-definition

Wrapper module for AWS CloudWatch Logs Insights query definitions.

## Source

This wrapper uses the upstream module from `terraform-aws-modules/cloudwatch/aws` and adds local naming, tagging, and region/environment defaults used in this repository.

## Usage

```hcl
module "query_definition" {
  source = "./modules/query-definition"

  environment     = "dev"
  region          = "ap-south-1"
  name            = "pc-dev-error-query"
  query_string    = "fields @timestamp, @message | sort @timestamp desc | limit 20"
  log_group_names = ["/aws/lambda/example"]
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `create` | Whether to create the Cloudwatch query definition | `bool` | `true` |
| `name` | The name of the query. | `string` | `n/a` |
| `query_string` | The The query to save. | `string` | `n/a` |
| `log_group_names` | Specific log groups to use with the query. | `list(string)` | `null` |
| `region` | AWS region | `string` | `"ap-south-1"` |
| `environment` | Deployment environment | `string` | `"dev"` |

## Outputs

| Name | Description |
|------|-------------|
| `cloudwatch_query_definition_id` | The query definition id. |

## Notes

- Default AWS region is `ap-south-1` unless overridden with `region`.
- Default deployment environment is `dev` unless overridden with `environment`.
- Most modules merge user-provided tags with repository-level common tags.
