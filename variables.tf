// Copyright 2026 tsuru authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

variable "name" {
  description = "Tsuru job name"
  type        = string
}

variable "team_owner" {
  description = "Tsuru job team owner"
  type        = string
}

variable "description" {
  description = "Tsuru job description"
  type        = string
  default     = ""
}

variable "plan" {
  description = "Tsuru job plan (see: tsuru plan list)"
  type        = string
  default     = "c0.1m0.1"
}

variable "pool" {
  description = "Tsuru pool (see: tsuru pool list)"
  type        = string
}

variable "schedule" {
  description = "Cron-like schedule for when the job should be triggered (keep empty for manual jobs)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tsuru tags"
  type        = set(string)
  default     = []
}

variable "active_deadline_seconds" {
  description = "Time a Job can run before its terminated. Defaults is 3600"
  type        = number
  default     = null
}

variable "concurrency_policy" {
  description = "Concurrency policy"
  type        = string
  default     = null
}

variable "container_image" {
  description = "Container image for the job"
  type        = string
  default     = null
}

variable "container_command" {
  description = "Container command for the job"
  type        = list(string)
  default     = null
}

variable "metadata" {
  description = "Job metadata with labels and annotations"
  type = object({
    labels      = optional(map(string), {})
    annotations = optional(map(string), {})
  })
  default = {
    labels      = {}
    annotations = {}
  }
}

variable "image" {
  description = "Docker image to be deployed to the job"
  type        = string
  default     = ""
}

variable "deploy" {
  description = "Deploy the job after creation"
  type        = bool
  default     = false
}

variable "deploy_wait" {
  description = "Wait for the rollout of deploy to complete"
  type        = bool
  default     = false
}

variable "environment_variables" {
  description = "Non-sensitive job ENV variables"
  type        = map(string)
  default     = {}
}

variable "private_environment_variables" {
  description = "Sensitive job ENV variables"
  type        = map(string)
  sensitive   = true
  default     = {}
}
