title "Docker Checks"
control 'Docker Image' do
  impact 'critical'
  title 'Docker Nginx Image'
  desc 'The Nginx image exists with specific tags'
  desc 'step', '9'
  desc 'optional', 'true'

  describe docker.images.where { repository == 'nginx' && tag == 'mainline' } do
    it { should exist }
  end
end

control 'Docker Container' do
  impact 'critical'
  title 'Docker Nginx Container running'
  desc 'The Nginx container is running, and has correct port bindings'
  desc 'step', '10'

  describe docker.containers.where { names == 'nginx' && image == 'nginx:mainline' && ports =~ /0.0.0.0:8080->80/ } do
    its('status') { should match [/Up/] }
  end
end
