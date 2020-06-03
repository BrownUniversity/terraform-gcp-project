

variable "activate_apis" {
  default = [
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]
}

# This are secrets. They are passsed in terraform.tfvars file
variable "billing_account" {}
variable "org_id" {}
variable "folder_id" {}
