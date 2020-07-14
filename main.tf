module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "= 8.0.1"

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


# -----------------------------
#   iam permissions
# -----------------------------

# Add necessary roles to service account for logging and monitoring
resource "google_project_iam_member" "logwriter" {
  project = module.project.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${module.project.service_account_email}"
}

resource "google_project_iam_member" "metricwriter" {
  project = module.project.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${module.project.service_account_email}"
}

resource "google_project_iam_member" "metadatawriter" {
  project = module.project.project_id
  role    = "roles/stackdriver.resourceMetadata.writer"
  member  = "serviceAccount:${module.project.service_account_email}"
}
