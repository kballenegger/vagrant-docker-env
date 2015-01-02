
class DockerEnvCommand < Vagrant.plugin(2, :command)
  def execute
    puts 'Hell'
    0
  end
end
