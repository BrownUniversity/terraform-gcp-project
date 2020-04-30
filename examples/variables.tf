# vim: syntax=terraform ts=2 sw=2 et:

# ----------------------------------------------------------------------------
# SHARED VARIABLES
# These variables are shared between the examples. Defined in terraform.tfvars
# ----------------------------------------------------------------------------

variable "billing_account" {}
variable "organization_id" {}

# ----------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters are optional.
# ----------------------------------------------------------------------------

variable "project_name" {
  default = ""
}

variable "folder_name" {
  default = ""
}

variable "environment" {
  default = "dev"
}

variable "activate_apis" {
  default = [
    "compute.googleapis.com",
    "bigquerystorage.googleapis.com",
  ]
}
