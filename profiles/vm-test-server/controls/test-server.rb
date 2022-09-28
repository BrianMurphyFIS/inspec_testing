title "test-server sshd check"
control 'test-server sshd check' do
  impact 'critical'
  title 'test-server sshd check'
  desc 'test-server sshd should be running'
  desc 'step', '1'

  describe service('sshd') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

