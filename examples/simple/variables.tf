# Copyright 2026 tsuru authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

variable "team_owner" {
  description = "The team that owns the jobs"
  type        = string
}

variable "pool" {
  description = "The pool where jobs will run"
  type        = string
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID for the scheduled job"
  type        = string
  sensitive   = true
  default     = "fake-access-key"
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key for the scheduled job"
  type        = string
  sensitive   = true
  default     = "fake-secret-key"
}

variable "database_password" {
  description = "Database password for migration job"
  type        = string
  sensitive   = true
  default     = "fake-db-password"
}
