control 'Azure VM Inventory' do
  impact 'critical'
  title 'Azure VM Inventory'
  desc 'Return Azure running VM instances. The ouput will be parsed to trigger Inspec jobs on each if they exist.'

  azure_virtual_machines(resource_group: 'test-group').ids.each do |vm_id|
    #vm = azure_virtual_machine(resource_id: vm_id).properties.networkProfile.networkInterfaces.each do |interface|
    vm = azure_virtual_machine(resource_id: vm_id)
    describe vm do
      its('name') { should eq 'mock' }
    end
    ip = azure_network_interface(resource_id: vm.properties.networkProfile.networkInterfaces[0].id).public_ip
    describe azure_public_ip(resource_id: ip) do
      its('properties.ipAddress') { should eq 'mock' }
    end
  end

end
