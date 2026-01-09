// Copyright 2026 tsuru authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

output "job_name" {
  description = "Job name"
  value       = tsuru_job.job.name
}

output "job_description" {
  description = "Job description"
  value       = tsuru_job.job.description
}

output "job_cluster" {
  description = "The name of the cluster where the job is deployed"
  value       = tsuru_job.job.cluster
}

output "job_schedule" {
  description = "Job schedule (cron format)"
  value       = tsuru_job.job.schedule
}

output "job_pool" {
  description = "Job pool"
  value       = tsuru_job.job.pool
}

output "job_plan" {
  description = "Job plan"
  value       = tsuru_job.job.plan
}

output "job_team_owner" {
  description = "Job team owner"
  value       = tsuru_job.job.team_owner
}

output "job_tags" {
  description = "Job tags"
  value       = tsuru_job.job.tags
}

output "job_environment_variables" {
  description = "Job environment variables (non-sensitive)"
  value       = tsuru_job_env.job_env.environment_variables
}

output "deploy_status" {
  description = "Deploy status"
  value       = var.deploy ? tsuru_job_deploy.job_deploy[0].status : null
}

output "deploy_output_image" {
  description = "Image generated after success of deploy"
  value       = var.deploy ? tsuru_job_deploy.job_deploy[0].output_image : null
}
