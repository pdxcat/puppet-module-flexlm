# This is the defined resource that creates a new flexlm
# license server.  It is split into two sections currently
# by a case statement, Solaris and a default.  The default
# section should work for the majority of all Linux.
#
# Example:
#
#   flexlm::service { 'kohles':
#    binary_path  => '/pkgs/flexlm/bin.kohles/lmgrd',
#    license_path => '/pkgs/flexlm/licenses/kohles/license.dat',
#   }
#
define flexlm::define::service (
  $binary_path = "/usr/local/bin/lmgrd",
  $license_path,
  $vendor_path = "",
  $enable = "true",
  $ensure = "running"
) {
  case $operatingsystem {
    "solaris": {

      file {
        "svcmanifest-${name}":
          path     => "/var/svc/manifest/site/flexlm-${name}",
          ensure   => present,
          content  => template("flexlm/${operatingsystem}/svcmanifest.erb"),
          owner    => 'root',
          group    => 'sys',
          mode     => '444',
          backup   => false;
      }
      service {
        "site/flexlm:${name}":
          ensure      => $ensure,
          enable      => $enable,
          hasstatus   => true,
          hasrestart  => true,
          manifest    => "/var/svc/manifest/site/flexlm-${name}",
          require     => [
            File["svcmanifest-${name}"],
            File["flexlm-logdir"],
          ];
      }

    }
    default: {

      file { 
        "init-${name}":
          path    => "/etc/init.d/flexlm-${name}",
          ensure  => present,
          content => template("flexlm/${operatingsystem}/initscript.erb"),
          owner   => 'root',
          group   => 'root',
          mode    => '754',
          backup  => false;
      }
      service {
        "flexlm-${name}":
          ensure     => $ensure,
          enable     => $enable,
          hasrestart => true,
          hasstatus  => true,
          require    => [
            File["init-${name}"],
            File["/usr/tmp"],
            File["flexlm-logdir"],
          ];
      }
    }

  }
}
