# ----------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These parameters are required.
# ----------------------------------------------------------------------------

variable "project_name" {
  description = "The human readable name for the project factory"
  type        = string
}

variable "billing_account" {
  description = "The billing account to use"
  type        = string
}

variable "folder_id" {
  description = "The existing folder to use for the project"
  type        = string
}

variable "activate_apis" {
  description = "The APIs to activate on the project"
  type        = list(string)
}

# ----------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ----------------------------------------------------------------------------
variable "org_id" {
  description = "Organization id."
  type        = string
  default     = "brown.edu"
}

variable "auto_create_network" {
  description = "Auto create default network."
  type        = bool
  default     = false
}

variable "default_service_account" {
  description = "Project default service account setting: can be one of delete, depriviledge, or keep."
  type        = string
  default     = "delete"
}

variable "disable_dependent_services" {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed."
  type        = bool
  default     = true
}

variable "labels" {
  type        = map(string)
  description = "Map of labels for project."
  default = {
    "environment" = "automation"
    "managed_by"  = "terraform"
  }
}
