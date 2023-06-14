

variable "activate_apis" {
  type = list(string)
  default = [
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]
}

# This are secrets. They are passsed in terraform.tfvars file
variable "billing_account" {
  type = string
}

variable "org_id" {
  type = string
}

variable "folder_id" {
  type = string
}
