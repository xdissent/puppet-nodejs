# Class: nodejs
#
# This module installs a full nodenv-driven node stack
#
class nodejs(
  $provider = $nodejs::provider,
  $prefix   = $nodejs::prefix,
  $user     = $nodejs::user,
) {
  if $::osfamily == 'Darwin' {
    include boxen::config
  }

  include nodejs::build

  $provider_class = "nodejs::${provider}"
  include $provider_class

  if $::osfamily == 'Darwin' {
    boxen::env_script { 'nodejs.sh':
      scriptname => 'nodejs',
      extension  => 'sh',
      priority   => 'higher',
      content    => template('nodejs/nodejs.sh'),
    }
    boxen::env_script { 'nodejs.fish':
      scriptname => 'nodejs',
      extension  => 'fish',
      priority   => 'higher',
      content    => template('nodejs/nodejs.fish'),
    }
  }

  file { '/opt/nodes':
    ensure => directory,
    owner  => $user,
  }

  Class['nodejs::build'] ->
    Class[$provider_class] ->
    Nodejs <| |> ->
    Npm_module <| |>
}
