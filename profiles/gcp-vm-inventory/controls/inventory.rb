control 'GCP VM Inventory' do
  impact 'critical'
  title 'GCP VM Inventory'
  desc 'Return GCP running Compute Engine instances. The ouput will be parsed to trigger Inspec jobs on each if they exist.'

  ##google_compute_instances(project: 'fundamental-run-363019', zone: 'us-west4-b').instance_ids.each do |instance|
  ##  if google_compute_instance(project: 'fundamental-run-363019', zone: 'us-west4-b', id: instance).state == 'RUNNING'
  ##    describe google_compute_instance(project: 'fundamental-run-363019', zone: 'us-west4-b', id: instance) do
  ##      its('name') { should eq 'mock' }
  ##      its('nat_ip') { should eq 'mock' }
  ##    end
  ##  end
  ##end
  google_compute_instances(project: 'fundamental-run-363019', zone: 'us-west4-b').instance_names.each do |name|
    describe google_compute_instance(project: 'fundamental-run-363019', zone: 'us-west4-b', name: name) do
      its('name') { should eq 'mock' }
    end
    describe google_compute_instance(project: 'fundamental-run-363019', zone: 'us-west4-b', name: name).network_interfaces[0].access_configs[0] do
      its('nat_ip') { should eq 'mock' }
    end
  end
end
