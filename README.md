# pc-cloudwatch-wrapper

Collection of Terraform wrapper modules for AWS CloudWatch services (Metric Alarms, Log Groups, Composite Alarms, Metric Streams, CIS Benchmarks etc.).

## Sub-modules

| Module | Description |
|--------|-------------|
| [`modules/cis-alarms`](modules/cis-alarms) | CIS benchmark metric filters and alarms |
| [`modules/composite-alarm`](modules/composite-alarm) | Composite alarms |
| [`modules/log-group`](modules/log-group) | Log groups |
| [`modules/log-metric-filter`](modules/log-metric-filter) | Log metric filters |
| [`modules/metric-alarm`](modules/metric-alarm) | Metric alarms |
| [`modules/metric-stream`](modules/metric-stream) | Metric streams |
<!-- Full list: log-anomaly-detector, log-data-protection-policy, log-stream, log-subscription-filter, metric-alarms-by-multiple-dimensions, query-definition --> |

Each sub-module has detailed README with Usage, Inputs, Outputs.

## Common

- AWS region default `ap-south-1`, env `dev`.
- Tagging/local naming standards.

See individual modules for usage.

