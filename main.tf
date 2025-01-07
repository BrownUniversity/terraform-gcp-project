module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 17.1"

  name                       = var.project_name
  random_project_id          = true
  project_id                 = var.project_id == null ? lower(replace(substr(var.project_name, 0, 24), " ", "-")) : var.project_id
  org_id                     = var.org_id
  folder_id                  = var.folder_id
  billing_account            = var.billing_account
  auto_create_network        = var.auto_create_network
  activate_apis              = var.activate_apis
  default_service_account    = var.default_service_account
  disable_dependent_services = var.disable_dependent_services
  labels                     = var.labels
  deletion_policy            = var.deletion_policy
}

# -----------------------------
#   iam permissions
# -----------------------------

module "projects_iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "8.0.0"

  mode     = "authoritative"
  projects = [module.project.project_id]
  bindings = {
    "roles/logging.logWriter" = [
      "serviceAccount:${module.project.service_account_email}"
    ]
    "roles/monitoring.metricWriter" = [
      "serviceAccount:${module.project.service_account_email}"
    ]
    "roles/stackdriver.resourceMetadata.writer" = [
      "serviceAccount:${module.project.service_account_email}"
    ]
  }
}
