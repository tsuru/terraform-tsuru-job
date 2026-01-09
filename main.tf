// Copyright 2026 tsuru authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

resource "tsuru_job" "job" {
  name        = var.name
  description = var.description
  plan        = var.plan
  team_owner  = var.team_owner
  pool        = var.pool
  schedule    = var.schedule
  tags        = var.tags

  active_deadline_seconds = var.active_deadline_seconds
  concurrency_policy      = var.concurrency_policy

  dynamic "container" {
    for_each = var.container_image != null ? [1] : []
    content {
      image   = var.container_image
      command = var.container_command
    }
  }

  metadata {
    labels      = var.metadata.labels
    annotations = var.metadata.annotations
  }

  lifecycle {
    ignore_changes = [
      container[0].image,
    ]
  }
}

resource "tsuru_job_deploy" "job_deploy" {
  count = var.deploy == false ? 0 : 1
  job   = tsuru_job.job.name
  image = var.image
  wait  = var.deploy_wait

  depends_on = [
    tsuru_job.job,
  ]
}

resource "tsuru_job_env" "job_env" {
  job                           = tsuru_job.job.name
  environment_variables         = var.environment_variables
  private_environment_variables = var.private_environment_variables
}

