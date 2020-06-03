title "Test creation of GCP Project"

project_id = attribute("project_id")
service_account_email = attribute("service_account_email")
activated_apis = attribute('activated_apis')
default_apis = [ 
  "compute.googleapis.com",
  "cloudresourcemanager.googleapis.com"
]
print activated_apis

describe google_project(project: project_id) do
  it { should exist }
  its('project_id') { should eq project_id }
end

describe google_project(project: project_id) do
  its('lifecycle_state') { should eq "ACTIVE" }
end

default_apis.each do |api|
  describe google_project_service(project: project_id, name: api) do
    it { should exist }
    its('state') { should cmp "ENABLED" }
  end
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
