require 'vagrant/docker/env/version'

class DockerEnv < Vagrant.plugin('2')
  name 'My Plugin'

  command 'docker-env' do
    require 'vagrant/docker/env/command'
    DockerEnvCommand
  end
end
