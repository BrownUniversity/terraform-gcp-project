# copyright: 2018, The Authors

title "Test creation of GCP Project"

project_id = attribute("project_id")
# project_id = "inspec-project-8151"
print "Project Id"
print project_id
# service_account_email = attribute("service_account_email")

# # content = inspec.profile.file("terraform.json")
# # params = JSON.parse(content)

# # PROJECT_ID = params['project_id']['value']
# # SERVICE_ACCOUNT_EMAIL = params['metadatawriter']['value']

describe google_project(project: project_id) do
  it { should exist }
  its('project_id') { should eq project_id }
end

# describe google_project(project: gcp_project_id) do
#   its('lifecycle_state') { should eq "ACTIVE" }
# end

# describe google_project_iam_binding(project: gcp_project_id,  role: 'roles/stackdriver.resourceMetadata.writer') do
#   it { should exist }
#   its('members') {should include service_account_email }
# end

# describe google_project_iam_binding(project: gcp_project_id,  role: 'roles/monitoring.metricWriter') do
#   it { should exist }
#   its('members') {should include service_account_email }
# end

# describe google_project_iam_binding(project: gcp_project_id,  role: 'roles/logging.logWriter') do
#   it { should exist }
#   its('members') {should include service_account_email }
# end
