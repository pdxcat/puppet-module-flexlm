# Begins initialization of a flexlm server.
# License servers are described by subclasses; e.g. flexlm::comsol.
class flexlm {

  case $::osfamily {
    'Debian': {
      # lmgrd expects to be able to use /usr/tmp
      file { '/usr/tmp':
        ensure => symlink,
        target => '/tmp',
      }

      package { 'lsb-core':
        ensure => installed,
      }
    }
    default: {}
  }

  file { 'flexlm-logdir':
    ensure => directory,
    path   => '/var/log/flexlm',
    owner  => 'daemon',
    group  => 'root',
    mode   => '0644',
  }
}
