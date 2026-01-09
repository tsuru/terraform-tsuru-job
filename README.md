# Terraform Tsuru Job Module

A comprehensive Terraform module for managing Tsuru jobs with Infrastructure as Code (IaC).

## Why This Module?

This module addresses several key challenges in Tsuru job management:

### Key Features

- Complete Tsuru job lifecycle management
- Job deployment with container images
- Environment variables management (sensitive and non-sensitive)
- Flexible scheduling with cron expressions
- Container configuration support
- Metadata management with labels and annotations

## Usage

### Basic Example

```hcl
module "my_job" {
  source = "github.com/tsuru/terraform-tsuru-job"

  name        = "my-scheduled-job"
  description = "My awesome scheduled job"
  plan        = "c0.5m1"
  pool        = "production"
  team_owner  = "my-team"
  schedule    = "0 2 * * *"  # Run daily at 2 AM
  tags        = ["cronjob", "production"]

  container_image   = "myregistry/myimage:latest"
  container_command = ["python", "script.py"]

  metadata = {
    labels = {
      "app"         = "data-processor"
      "environment" = "production"
    }
    annotations = {
      "description" = "Daily data processing job"
    }
  }

  environment_variables = {
    LOG_LEVEL = "info"
    APP_ENV   = "production"
  }

  private_environment_variables = {
    API_KEY = "your-api-key-here"
    SECRET_TOKEN = "your-secret-token"
  }
}
```

## Examples

Check the [`examples/`](examples/) directory for complete usage examples:

- **[simple](examples/simple/)** - Basic usage showing scheduled and manual jobs

Each example includes a detailed README with instructions and important notes about deployment requirements.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.8

## Contributing

For more details on how to contribute please see the [contributing](CONTRIBUTING.md) guideline.

## Maintainers

This module is maintained by:

- **[@elojas2](https://github.com/elojas2)** - Eloyse Fernanda
- **[@fbtravi](https://github.com/fbtravi)** - Felipe Travi
- **[@iriscafe](https://github.com/iriscafe)** - Iris Café
- **[@wpjunior](https://github.com/wpjunior)** - Wilson Júnior

Feel free to reach out to the maintainers for questions, suggestions, or if you're interested in becoming a maintainer yourself.

---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_tsuru"></a> [tsuru](#requirement\_tsuru) | ~> 2.17.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tsuru"></a> [tsuru](#provider\_tsuru) | ~> 2.17.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tsuru_job.job](https://registry.terraform.io/providers/tsuru/tsuru/latest/docs/resources/job) | resource |
| [tsuru_job_deploy.job_deploy](https://registry.terraform.io/providers/tsuru/tsuru/latest/docs/resources/job_deploy) | resource |
| [tsuru_job_env.job_env](https://registry.terraform.io/providers/tsuru/tsuru/latest/docs/resources/job_env) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_deadline_seconds"></a> [active\_deadline\_seconds](#input\_active\_deadline\_seconds) | Time a Job can run before its terminated. Defaults is 3600 | `number` | `null` | no |
| <a name="input_concurrency_policy"></a> [concurrency\_policy](#input\_concurrency\_policy) | Concurrency policy | `string` | `null` | no |
| <a name="input_container_command"></a> [container\_command](#input\_container\_command) | Container command for the job | `list(string)` | `null` | no |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Container image for the job | `string` | `null` | no |
| <a name="input_deploy"></a> [deploy](#input\_deploy) | Deploy the job after creation | `bool` | `false` | no |
| <a name="input_deploy_wait"></a> [deploy\_wait](#input\_deploy\_wait) | Wait for the rollout of deploy to complete | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Tsuru job description | `string` | `""` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Non-sensitive job ENV variables | `map(string)` | `{}` | no |
| <a name="input_image"></a> [image](#input\_image) | Docker image to be deployed to the job | `string` | `""` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Job metadata with labels and annotations | <pre>object({<br/>    labels      = optional(map(string), {})<br/>    annotations = optional(map(string), {})<br/>  })</pre> | <pre>{<br/>  "annotations": {},<br/>  "labels": {}<br/>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | Tsuru job name | `string` | n/a | yes |
| <a name="input_plan"></a> [plan](#input\_plan) | Tsuru job plan (see: tsuru plan list) | `string` | `"c0.1m0.1"` | no |
| <a name="input_pool"></a> [pool](#input\_pool) | Tsuru pool (see: tsuru pool list) | `string` | n/a | yes |
| <a name="input_private_environment_variables"></a> [private\_environment\_variables](#input\_private\_environment\_variables) | Sensitive job ENV variables | `map(string)` | `{}` | no |
| <a name="input_schedule"></a> [schedule](#input\_schedule) | Cron-like schedule for when the job should be triggered (keep empty for manual jobs) | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tsuru tags | `set(string)` | `[]` | no |
| <a name="input_team_owner"></a> [team\_owner](#input\_team\_owner) | Tsuru job team owner | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deploy_output_image"></a> [deploy\_output\_image](#output\_deploy\_output\_image) | Image generated after success of deploy |
| <a name="output_deploy_status"></a> [deploy\_status](#output\_deploy\_status) | Deploy status |
| <a name="output_job_cluster"></a> [job\_cluster](#output\_job\_cluster) | The name of the cluster where the job is deployed |
| <a name="output_job_description"></a> [job\_description](#output\_job\_description) | Job description |
| <a name="output_job_environment_variables"></a> [job\_environment\_variables](#output\_job\_environment\_variables) | Job environment variables (non-sensitive) |
| <a name="output_job_name"></a> [job\_name](#output\_job\_name) | Job name |
| <a name="output_job_plan"></a> [job\_plan](#output\_job\_plan) | Job plan |
| <a name="output_job_pool"></a> [job\_pool](#output\_job\_pool) | Job pool |
| <a name="output_job_schedule"></a> [job\_schedule](#output\_job\_schedule) | Job schedule (cron format) |
| <a name="output_job_tags"></a> [job\_tags](#output\_job\_tags) | Job tags |
| <a name="output_job_team_owner"></a> [job\_team\_owner](#output\_job\_team\_owner) | Job team owner |
<!-- END_TF_DOCS -->
