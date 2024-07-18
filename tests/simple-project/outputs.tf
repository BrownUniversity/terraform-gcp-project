output "project_name" {
  value = module.simple-project.project_name
}

output "project_id" {
  value = module.simple-project.project_id
}

output "service_account_display_name" {
  value = module.simple-project.service_account_display_name
}

output "service_account_email" {
  value = module.simple-project.service_account_email
}

output "enabled_apis" {
  value = module.simple-project.enabled_apis
}

output "roles" {
  value = module.simple-project.roles
}

output "activate_apis" {
  value = var.activate_apis
}

output "organization_id" {
  value = var.org_id
}

output "folder_id" {
  value = var.folder_id
}
