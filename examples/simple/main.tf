# Copyright 2026 tsuru authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

terraform {
  required_providers {
    tsuru = {
      source  = "tsuru/tsuru"
      version = "~> 2.17.1"
    }
  }
}

# Example 1: Scheduled Job
module "scheduled_job" {
  source = "../../"

  name        = "data-processor-scheduled"
  description = "Process data files every 6 hours"
  plan        = "c0.5m1"
  pool        = var.pool
  team_owner  = var.team_owner
  schedule    = "0 */6 * * *" # Every 6 hours
  tags        = ["data", "processing", "scheduled"]

  active_deadline_seconds = 3600 # 1 hour timeout
  concurrency_policy      = "Forbid"

  container_image   = "myregistry/data-processor:latest"
  container_command = ["python", "process_data.py"]

  metadata = {
    labels = {
      "app"         = "data-processor"
      "environment" = "production"
      "type"        = "scheduled"
    }
    annotations = {
      "description" = "Processes data files from S3"
      "owner"       = "data-team@example.com"
    }
  }

  environment_variables = {
    LOG_LEVEL     = "info"
    BATCH_SIZE    = "1000"
    OUTPUT_FORMAT = "json"
  }

  private_environment_variables = {
    AWS_ACCESS_KEY_ID     = var.aws_access_key_id
    AWS_SECRET_ACCESS_KEY = var.aws_secret_access_key
  }
}

# Example 2: Manual Job (no schedule)
module "manual_job" {
  source = "../../"

  name        = "database-migration"
  description = "Manual database migration job"
  plan        = "c1m2"
  pool        = var.pool
  team_owner  = var.team_owner
  # No schedule - manual execution only
  tags = ["database", "migration", "manual"]

  active_deadline_seconds = 7200 # 2 hour timeout

  container_image   = "myregistry/db-migrator:latest"
  container_command = ["./migrate.sh"]

  metadata = {
    labels = {
      "app"         = "db-migrator"
      "environment" = "production"
      "type"        = "manual"
    }
    annotations = {
      "description" = "Database migration job"
      "runbook"     = "https://wiki.example.com/db-migrations"
    }
  }

  environment_variables = {
    DATABASE_NAME = "production_db"
    MIGRATION_DIR = "/migrations"
  }

  private_environment_variables = {
    DATABASE_PASSWORD = var.database_password
  }
}

# Example 3: Job with deployment
module "job_with_deploy" {
  source = "../../"

  name        = "report-generator"
  description = "Generate weekly reports"
  plan        = "c2m4"
  pool        = var.pool
  team_owner  = var.team_owner
  schedule    = "0 3 * * 1" # Every Monday at 3 AM
  tags        = ["reports", "weekly"]

  container_image   = "myregistry/report-gen:v1.0.0"
  container_command = ["python", "generate_reports.py"]

  # Deploy a new version
  deploy      = true
  deploy_wait = true
  image       = "myregistry/report-gen:v1.1.0"

  metadata = {
    labels = {
      "app"         = "report-generator"
      "environment" = "production"
    }
  }

  environment_variables = {
    REPORT_TYPE = "weekly"
    TIMEZONE    = "UTC"
  }
}
