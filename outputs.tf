output "project_name" {
  value = module.project.project_name
}

output "project_id" {
  value = module.project.project_id
}

output "project_number" {
  value = module.project.project_number
}

output "service_account_display_name" {
  value = module.project.service_account_display_name
}

output "service_account_email" {
  value = module.project.service_account_email
}

output "activate_apis" {
  value = var.activate_apis
}

output "org_id" {
  value = var.org_id
}

output "folder_id" {
  value = var.folder_id
}
