require 'vagrant/docker/env/version'

class DockerEnv < Vagrant.plugin('2')
  name 'My Plugin'

  command 'run-my-plugin' do
    require_relative 'command'
    Command
  end
end
