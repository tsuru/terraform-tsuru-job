# Copyright 2026 tsuru authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

output "scheduled_job_name" {
  description = "Name of the scheduled job"
  value       = module.scheduled_job.job_name
}

output "scheduled_job_schedule" {
  description = "Schedule of the scheduled job"
  value       = module.scheduled_job.job_schedule
}

output "scheduled_job_cluster" {
  description = "Cluster where the scheduled job runs"
  value       = module.scheduled_job.job_cluster
}

output "manual_job_name" {
  description = "Name of the manual job"
  value       = module.manual_job.job_name
}

output "manual_job_cluster" {
  description = "Cluster where the manual job runs"
  value       = module.manual_job.job_cluster
}

output "report_job_name" {
  description = "Name of the report generator job"
  value       = module.job_with_deploy.job_name
}

output "report_job_deploy_status" {
  description = "Deploy status of the report generator job"
  value       = module.job_with_deploy.deploy_status
}

output "report_job_output_image" {
  description = "Output image of the report generator job after deploy"
  value       = module.job_with_deploy.deploy_output_image
}
