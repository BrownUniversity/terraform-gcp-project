# copyright: 2018, The Authors

title "Test creation of GCP Project"

project_id = attribute("project_id")

service_account_email = attribute("service_account_email")

describe google_project(project: project_id) do
  it { should exist }
  its('project_id') { should eq project_id }
end

describe google_project(project: project_id) do
  its('lifecycle_state') { should eq "ACTIVE" }
end


describe google_project_iam_binding(project: project_id,  role: 'roles/stackdriver.resourceMetadata.writer') do
  it { should exist }
  its('members') {should include "serviceAccount:#{service_account_email}" }
end

describe google_project_iam_binding(project: project_id,  role: 'roles/monitoring.metricWriter') do
  it { should exist }
  its('members') {should include "serviceAccount:#{service_account_email}" }
end

describe google_project_iam_binding(project: project_id,  role: 'roles/logging.logWriter') do
  it { should exist }
  its('members') {should include "serviceAccount:#{service_account_email}" }
end
