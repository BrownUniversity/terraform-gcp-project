output domain {
  value = module.sample-project.domain
}

output "project_name" {
  value = module.sample-project.project_name
}

output project_id {
  value = module.sample-project.project_id
}

output project_number {
  value = module.sample-project.project_number
}

output service_account_display_name {
  value = module.sample-project.service_account_display_name
}

output service_account_email {
  value = module.sample-project.service_account_email
}

output "activate_apis" {
  value = module.sample-project.activate_apis
}
