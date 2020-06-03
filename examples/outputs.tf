output "project_name" {
  value = module.sample-project.project_name
}

output "project_id" {
  value = module.sample-project.project_id
}

output "service_account_display_name" {
  value = module.sample-project.service_account_display_name
}

output "service_account_email" {
  value = module.sample-project.service_account_email
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
