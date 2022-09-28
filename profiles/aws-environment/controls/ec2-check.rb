title 'EC2 Instances'
control 'EC2 Instances' do
  impact 'critical'
  title 'EC2 Instances'
  desc 'Check if EC2 instances exist and are running.'
  desc 'step', '4'

  describe.one do
    describe "instance" do
      # purposely failing test to work around describe.one bug
      it { should eq "running" }
    end
    aws_ec2_instances.where(name: 'test-server').instance_ids.each do |instance|
      describe aws_ec2_instance(instance_id: instance) do
        its('name') { should eq 'test-server' }
        it { should exist }
        it { should be_running }
      end
    end
  end

  describe.one do
    describe "instance" do
      # purposely failing test to work around describe.one bug
      it { should eq "running" }
    end
    aws_ec2_instances.where(name: 'test-server-2').instance_ids.each do |instance|
      describe aws_ec2_instance(instance_id: instance) do
        its('name') { should eq 'test-server-2' }
        it { should exist }
        it { should be_running }
      end
    end
  end

  describe.one do
    describe "instance" do
      # purposely failing test to work around describe.one bug
      it { should eq "running" }
    end
    aws_ec2_instances.where(name: 'test-server-2').instance_ids.each do |instance|
      describe aws_ec2_instance(instance_id: instance) do
        its('name') { should eq 'test-server-2' }
        it { should exist }
        it { should be_running }
      end
    end
  end

end
