module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 6.0"

  name                       = var.project_name
  random_project_id          = true
  org_id                     = var.org_id
  folder_id                  = var.folder_id
  billing_account            = var.billing_account
  auto_create_network        = var.auto_create_network
  activate_apis              = var.activate_apis
  default_service_account    = var.default_service_account
  disable_dependent_services = var.disable_dependent_services
  labels                     = var.labels
}


