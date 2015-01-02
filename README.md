# Vagrant::Docker::Env

This gem is super ghetto... it should not be used by anybody except for me. The
unfortunate sitation is that Vagrant requires a real RubyGem in order to use a
plugin, and for that reason this is published publically.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vagrant-docker-env'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vagrant-docker-env

## Usage

If you insist on using this, it’s pretty simple. Add this snippet to your
Vagrantfile:

```ruby
$DOCKER_ENV = {
  DOCKER_TLS_VERIFY: '',
  DOCKER_HOST: 'tcp://...',
}
```

Then, this plugin makes the `docker-env` command available, which you can use in
one of two ways:

    eval $(vagrant docker-env)

This will add those environment variables to your current shell.

    vagrant docker-env -- docker ps
    vagrant docker-env -- fig up

Any commands typed after `vagrant docker-env --` will be run with those
variables set in their environment.

The purpose of this plugin is to facilitate running Docker containers on OS X.
The Docker-Vagrant integration is not used. Instead, Vagrant is used to run
a VM which contains the Docker host, after which Docker is used natively with
the help of this `docker-env` command.

With this command, it’s easy to use multiple Docker hosts simultaneously, which
is useful when working with more than one project.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/vagrant-docker-env/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
