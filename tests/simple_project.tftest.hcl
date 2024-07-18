run "simple_project_test" {

    module {
        source = "./tests/simple-project"
    }

    assert {
      condition = simple-project.id != null
      error_message = "Project does not exist!"
    }
}