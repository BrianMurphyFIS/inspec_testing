title 'Azure Instances'
control 'Azure Instances' do
  impact 'critical'
  title 'Azure Instances'
  desc 'Check if Azure VM instances exist and are running.'
  desc 'step', '5'

  vm = azure_virtual_machine(resource_group: 'test-group', name: 'azure-test-server')
  describe vm do
    it { should exist }
  end
  describe azure_generic_resource(resource_id: "#{vm.id}/instanceView", ignore_error: true ).statuses[1].code do
    it { should eq 'PowerState/running' }
  end

  vm = azure_virtual_machine(resource_group: 'test-group', name: 'azure-test-server-2')
  describe vm do
    it { should exist }
  end
  describe azure_generic_resource(resource_id: "#{vm.id}/instanceView", ignore_error: true ).statuses[1].code do
    it { should eq 'PowerState/running' }
  end

end
