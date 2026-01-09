# Simple Job Example

This example demonstrates basic usage of the Terraform Tsuru Job module with both scheduled and manual jobs.

## Usage

### Prerequisites

1. Configure the Tsuru provider with your credentials:

```bash
export TSURU_HOST="https://your-tsuru-instance.com"
export TSURU_TOKEN="your-tsuru-token"
```

2. Update the variables in `terraform.tfvars` or pass them via command line.

### Deploy

```bash
terraform init
terraform plan
terraform apply
```

### Destroy

```bash
terraform destroy
```

## What This Example Creates

1. **Scheduled Job**: A job that runs every 6 hours
   - Uses a custom container image
   - Configured with environment variables
   - Has metadata labels and annotations

2. **Manual Job**: A job that must be triggered manually
   - No schedule defined
   - Can be executed on-demand via Tsuru CLI

## Important Notes

- The `container.image` field in `tsuru_job` resource is for the initial job creation
- Use `tsuru_job_deploy` resource (or set `deploy = true` in the module) to deploy new images
- Environment variables are managed separately via `tsuru_job_env` resource
- The module automatically handles the dependencies between resources

## Variables

| Name | Description | Required |
|------|-------------|----------|
| team_owner | The team that owns the jobs | Yes |
| pool | The pool where jobs will run | Yes |

## Outputs

The example outputs information about both jobs including:
- Job names
- Schedules
- Clusters
- Environment variables
