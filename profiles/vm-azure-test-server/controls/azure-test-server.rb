title "azure-test-server sshd check"
control 'azure-test-server sshd check' do
  impact 'critical'
  title 'azure-test-server sshd check'
  desc 'azure-test-server sshd should be running'
  desc 'step', '3'

  describe service('sshd') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

