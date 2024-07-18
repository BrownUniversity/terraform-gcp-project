# ----------------------------------------------------------------------------
# TEST RESOURCES
# These resources are directly tested.
# ----------------------------------------------------------------------------
locals {
  project_name = "inspec-project"

}

module "simple-project" {
  source = "../../"

  project_name    = local.project_name
  billing_account = var.billing_account
  activate_apis   = var.activate_apis
  folder_id       = var.folder_id
  org_id          = var.org_id
}

resource "google_project" "project" {
  name       = module.simple-project.project_name
  project_id = module.simple-project.project_id
}
