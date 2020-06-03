# ----------------------------------------------------------------------------
# TEST RESOURCES
# These resources are directly tested.
# ----------------------------------------------------------------------------
locals {
  project_name = "inspec-project"

}

module "sample-project" {
  source = "../"

  project_name    = local.project_name
  billing_account = var.billing_account
  activate_apis   = var.activate_apis
  folder_id       = var.folder_id
}
