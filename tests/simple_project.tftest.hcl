run "simple_project_test" {

    module {
        source = "./tests/simple-project"
    }

    assert {
      condition = output.project_id != null
      error_message = "Project does not exist!"
    }

    assert {
      condition = output.project_name == "inspec-project"
      error_message = "Project name is not correct!"
    }

    assert {
      condition = contains(output.enabled_apis, "compute.googleapis.com")
      error_message = "Compute API is not enabled!"
    }

    assert {
      condition = contains(output.enabled_apis, "cloudresourcemanager.googleapis.com")
      error_message = "Cloud Resource Manager API is not enabled!"
    }

    assert {
      condition = contains(output.members, "serviceAccount:${output.service_account_email}")
      error_message = "Service account not a member to the project!"
    }

    assert {
      condition = contains(output.roles, "roles/stackdriver.resourceMetadata.writer")
      error_message = "Stackdriver IAM binding not created!"
    }

    assert {
      condition = contains(output.roles, "roles/monitoring.metricWriter")
      error_message = "Monitoring IAM binding not created!"
    }

    assert {
      condition = contains(output.roles, "roles/logging.logWriter")
      error_message = "Logging IAM binding not created!"
    }
}