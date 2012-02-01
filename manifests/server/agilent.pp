# The license server for Agilent stuff
class flexlm::server::agilent {
  include flexlm

  flexlm::define::service {
    "agilent":
      binary_path  => "/pkgs/license/flexlm/current/lmgrd",
      license_path => "/pkgs/license/vendor/agilent/licenses/license.dat";
  }
}
