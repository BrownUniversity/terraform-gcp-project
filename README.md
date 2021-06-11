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
| terraform | >= 1.0 |
| google | >= 3.0, <4.0.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| activate\_apis | The APIs to activate on the project | `list(string)` | n/a | yes |
| auto\_create\_network | Auto create default network. | `bool` | `false` | no |
| billing\_account | The billing account to use | `string` | n/a | yes |
| default\_service\_account | Project default service account setting: can be one of delete, depriviledge, or keep. | `string` | `"delete"` | no |
| disable\_dependent\_services | Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. | `bool` | `true` | no |
| folder\_id | The existing folder to use for the project | `string` | n/a | yes |
| labels | Map of labels for project. | `map(string)` | <pre>{<br>  "environment": "automation",<br>  "managed_by": "terraform"<br>}</pre> | no |
| org\_id | Organization id. | `string` | `"brown.edu"` | no |
| project\_id | Make project\_id a user-settable parameter | `string` | `""` | no |
| project\_name | The human readable name for the project factory | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| activate\_apis | Active Google APIS |
| folder\_id | Folder ID |
| org\_id | Organization ID |
| project\_id | Project ID |
| project\_name | Project Name |
| service\_account\_display\_name | Name of service account |
| service\_account\_email | Email for service account |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Testing

This repository uses Kitchen-Terraform to test the terraform modules. In the [examples](/examples)directory you can find examples of how each module can be used. Those examples are fed to [Test Kitchen][https://kitchen.ci/]. To install test kitchen, first make sure you have Ruby and bundler installed.

```
brew install ruby
gem install bundler
```

Then install the prerequisites for test kitchen.

```
bundle install
```

You'll need to add some common credentials and secret variables

And now you're ready to run test kitchen. Test kitchen has a couple main commands:

- `bundle exec kitchen create` initializes terraform.
- `bundle exec kitchen converge` runs our terraform examples.
- `bundle exec kitchen verify` runs our inspec scripts against a converged kitchen.
- `bundle exec kitchen destroy` destroys infrastructure.
- `bundle exec kitchen test` does all the above.


## Development

### Merging Policy
Use [GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html#production-branch-with-gitlab-flow).

* Create feature branches for features and fixes from default branch
* Merge only from PR with review
* After merging to default branch a release is drafted using a github action. Check the draft and publish if you and tests are happy

### Pre-commit hooks
Install and configure terraform [pre-commit hooks](https://github.com/antonbabenko/pre-commit-terraform)
To run them: `pre-commit run -a`

### CI
This project has three workflows enabled:

1. PR labeler: When openning a PR to defaukt branch, a label is given assigned automatically accourding to the name of your feature branch. The labeler follows the follows rules in [pr-labeler.yml](.github/pr-labeler.yml)

2. Realease Drafter: When merging to master, a release is drafted using the [Release-Drafter Action](https://github.com/marketplace/actions/release-drafter)

3. `Kitchen test` is run on every commit unless `[skip ci]` is added to commit message.
