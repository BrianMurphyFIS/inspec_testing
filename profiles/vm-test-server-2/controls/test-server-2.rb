title "test-server-2 sshd check"
control 'test-server-2 sshd check' do
  impact 'critical'
  title 'test-server-2 sshd check'
  desc 'test-server-2 sshd should be running'
  desc 'step', '2'

  describe service('sshd') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

