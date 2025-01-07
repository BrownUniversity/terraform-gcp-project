# terraform-gcp-project

![kitchen-tests](https://github.com/BrownUniversity/terraform-gcp-project/workflows/kitchen-tests/badge.svg)

[Terraform](https://www.terraform.io/) module for creating a project in GCP. The requiered and default input variables are consistent with oranizational needs at Brown University. Basic features:

- Based in Google's project factory
- Requires project to reside inside a folder
- Enables monitoring and logging

# Contents:

- [Getting Started](#getting-started)
- [How to use this module](#how-to-use-this-module)
- [Requirements](#requirements)
- [Providers](#providers)
- [Inputs](#inputs)
- [Testing](#testing)
- [Development](#development)


## Getting Started

This module depends on you having GCP credentials of some kind. The module looks for a credential file in JSON format. You should export the following:

```
GOOGLE_APPLICATION_CREDENTIALS=/path/to/file.json
```

## How to use this module

This folder defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this folder. See the [examples](/examples) folder for guidance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.15.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project"></a> [project](#module\_project) | terraform-google-modules/project-factory/google | ~> 15.0 |
| <a name="module_projects_iam_bindings"></a> [projects\_iam\_bindings](#module\_projects\_iam\_bindings) | terraform-google-modules/iam/google//modules/projects_iam | 7.7.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | The APIs to activate on the project | `list(string)` | n/a | yes |
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Auto create default network. | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The billing account to use | `string` | n/a | yes |
| <a name="input_default_service_account"></a> [default\_service\_account](#input\_default\_service\_account) | Project default service account setting: can be one of delete, depriviledge, or keep. | `string` | `"delete"` | no |
| <a name="input_disable_dependent_services"></a> [disable\_dependent\_services](#input\_disable\_dependent\_services) | Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. | `bool` | `true` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The existing folder to use for the project | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of labels for project. | `map(string)` | <pre>{<br>  "environment": "automation",<br>  "managed_by": "terraform"<br>}</pre> | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization id. | `string` | `"brown.edu"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Make project\_id a user-settable parameter | `string` | `""` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The human readable name for the project factory | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_activate_apis"></a> [activate\_apis](#output\_activate\_apis) | Activate APIs |
| <a name="output_enabled_apis"></a> [enabled\_apis](#output\_enabled\_apis) | Active Google APIS |
| <a name="output_folder_id"></a> [folder\_id](#output\_folder\_id) | Folder ID |
| <a name="output_members"></a> [members](#output\_members) | Members |
| <a name="output_org_id"></a> [org\_id](#output\_org\_id) | Organization ID |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | Project ID |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | Project Name |
| <a name="output_roles"></a> [roles](#output\_roles) | Roles |
| <a name="output_service_account_display_name"></a> [service\_account\_display\_name](#output\_service\_account\_display\_name) | Name of service account |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | Email for service account |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->



## Local Development

### Merging Policy
Use [GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html#production-branch-with-gitlab-flow).

* Create feature branches for features and fixes from default branch
* Merge only from PR with review
* After merging to default branch a release is drafted using a github action. Check the draft and publish if you and tests are happy

### Version managers

We recommend using [asdf](https://asdf-vm.com) to manage your versions of Terraform.

```
brew install asdf
```

### Terraform

You can also install the latest version of terraform version via brew.

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

#### Pre-commit hooks

You should make sure that pre-commit hooks are installed to run the formater, linter, etc. Install and configure terraform [pre-commit hooks](https://github.com/antonbabenko/pre-commit-terraform) as follows:

```
brew install pre-commit
```

Install the pre-commit hook globally
```
DIR=~/.git-template
git config --global init.templateDir ${DIR}
pre-commit init-templatedir -t pre-commit ${DIR}
```

To run the hooks specified in `.pre-commit-config.yaml`: 

```
pre-commit run -a
```

### GCloud

This is only needed if running tests locally. The google-cloud-sdk is included in the Brewfile so it should now be installed
This repo includes a `env.sh` file that where you set the path to the google credentials file, then use

```
source env.sh
```

and

```
deactivate
```

to set and uset the `GOOGLE_APPLICATION_CREDENTIALS` variable.


### Testing

The tests can be run locally with `terraform test` after running `terraform init`. You will need to supply `org_id`, `folder_id`, and `billing_account` variables through `terraform.tfvars` file. Please see `terraform.tfvars.example` file for an example.


### CI
This project has three workflows enabled:

1. PR labeler: When openning a PR to defaukt branch, a label is given assigned automatically accourding to the name of your feature branch. The labeler follows the follows rules in [pr-labeler.yml](.github/pr-labeler.yml)

2. Realease Drafter: When merging to master, a release is drafted using the [Release-Drafter Action](https://github.com/marketplace/actions/release-drafter)

3. `terraform test` runs on PR, merge to main and releases.
