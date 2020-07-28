output "project_name" {
  description = "Project Name"
  value       = module.project.project_name
}

output "project_id" {
  description = "Project ID"
  value       = module.project.project_id
}

output "service_account_display_name" {
  description = "Name of service account"
  value       = module.project.service_account_display_name
}

output "service_account_email" {
  description = "Email for service account"
  value       = module.project.service_account_email
}

output "activate_apis" {
  description = "Active Google APIS"
  value       = var.activate_apis
}

output "org_id" {
  description = "Organization ID"
  value       = var.org_id
}

output "folder_id" {
  description = "Folder ID"
  value       = var.folder_id
}
