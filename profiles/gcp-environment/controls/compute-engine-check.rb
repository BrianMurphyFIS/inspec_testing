title 'GCP Instances'
control 'GCP Instances' do
  impact 'critical'
  title 'GCP Instances'
  desc 'Check if GCP instances exist and are running.'
  desc 'step', '6'

  describe google_compute_instance(project: 'fundamental-run-363019', zone: 'us-west4-b', name: 'gcp-test-server') do
    its('status') { should eq 'RUNNING' }
  end

  describe google_compute_instance(project: 'fundamental-run-363019', zone: 'us-west4-b', name: 'gcp-test-server-2') do
    its('status') { should eq 'RUNNING' }
  end

end
