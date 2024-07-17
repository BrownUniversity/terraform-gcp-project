run "simple_project_test" {

    module {
        source = "./tests/simple-project"
    }

    variables {
        org_id = "123456789"
        folder_id = "123456789"
        billing_account = ""
    }

    assert {
      condition = simple-project.id != null
      error_message = "Project does not exist!"
    }
}