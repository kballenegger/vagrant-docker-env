
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
    if subcommand.empty?
      execute_subcommand(subcommand)
    else
      print_env
    end
    0
  end

  def execute_subcommand(subcommand)
    ($DOCKER_ENV || {}).each do |k,v|
      ENV[k] = v
    end
    system(subcommand)
  end

  def print_env
    str = ($DOCKER_ENV || {}).map do |k,v|
      "export #{k}=\"#{v}\""
    end.join("\n")
    puts str
  end
end
