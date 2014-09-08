# This is the defined resource that creates a new flexlm
# license service.
#
# Example:
#
#   flexlm::service { 'vendorA':
#    binary_path  => '/pkgs/flexlm/vendorA/lmgrd',
#    license_path => '/pkgs/flexlm/licenses/vendorA/license.dat',
#   }
#
define flexlm::service (
  $license_path,
  $ensure        = 'running',
  $binary_path   = '/usr/local/bin/lmgrd',
  $vendor_path   = '',
  $enable        = true,
) {

  include flexlm

  case $::osfamily {
    'SunOS': {

      file { "svcmanifest-${name}":
        ensure  => present,
        path    => "/var/svc/manifest/site/flexlm-${name}",
        content => template('flexlm/svcmanifest.erb'),
        owner   => 'root',
        group   => 'sys',
        mode    => '0444',
        backup  => false,
      }

      service { "site/flexlm:${name}":
        ensure     => $ensure,
        enable     => $enable,
        hasstatus  => true,
        hasrestart => true,
        manifest   => "/var/svc/manifest/site/flexlm-${name}",
        require    => [
          File["svcmanifest-${name}"],
          File['flexlm-logdir'],
        ],
      }
    }
    'Debian': {

      file { "init-${name}":
        ensure  => present,
        path    => "/etc/init.d/flexlm-${name}",
        content => template('flexlm/initscript.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0754',
        backup  => false,
      }

      service { "flexlm-${name}":
        ensure     => $ensure,
        enable     => $enable,
        hasrestart => true,
        hasstatus  => true,
        require    => [
          File["init-${name}"],
          File['/usr/tmp'],
          File['flexlm-logdir'],
        ],
      }
    }
    default: {
      fail("${::osfamily} is not supported")
    }
  }
}
