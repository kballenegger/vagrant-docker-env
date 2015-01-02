
# Reads the docker env from the global $DOCKER_ENV
#
class DockerEnvCommand < Vagrant.plugin(2, :command)

  def execute
    marker_found = false
    subcommand, _ = ARGV.partition do |e|
      marker_found.tap do |_|
        marker_found = true if e == '--'
      end
    end
    load_config
    if subcommand.empty?
      print_env
    else
      execute_subcommand(subcommand)
    end
    0
  end

  def load_config
    loader = @env.config_loader
    loader.load([])
  end

  def execute_subcommand(subcommand)
    ($DOCKER_ENV || {}).each do |k,v|
      ENV[k.to_s] = v
    end
    system(*subcommand)
  end

  def print_env
    str = ($DOCKER_ENV || {}).map do |k,v|
      "export #{k}=\"#{v}\""
    end.join("\n")
    STDOUT.puts str
  end
end
