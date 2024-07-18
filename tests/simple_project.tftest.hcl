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
      condition = module.simple-project.name == "inspect-project"
      error_message = "Project name is not correct!"
    }

    assert {
      condition = module.simple-project.lifecycle_state == "ACTIVE"
      error_message = "Project is not active"
    }

    assert {
      condition = google_project.project.parent[0].type == "folder"
      error_message = "Project parent type is not 'folder'"
    }

    assert {
      condition = google_project.project.parent[0].id == var.folder_id
      error_message = "Project parent ID does not match"
    }

    // assert {
    //   condition = length([for api in var.activated_apis : api if contains(google_project_service.test_activated_apis[*].service, api)]) == length(var.activated_apis)
    //   error_message = "Not all APIs are activated"
    // }

    // assert {
    //   condition = contains(google_project_iam_binding.test_logging_logWriter.members, "serviceAccount:${var.service_account_email}")
    //   error_message = "Logging IAM binding does not include the service account"
    // }

    // assert {
    //   condition = contains(google_project_iam_binding.test_monitoring_metricWriter.members, "serviceAccount:${var.service_account_email}")
    //   error_message = "Monitoring IAM binding does not include the service account"
    // }

    // assert {
    //   condition = contains(google_project_iam_binding.test_stackdriver_resourceMetadata_writer.members, "serviceAccount:${var.service_account_email}")
    //   error_message = "Stackdriver IAM binding does not include the service account"
    // }
}