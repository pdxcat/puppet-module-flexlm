# The license server for Mentor stuff
class flexlm::server::mentor {
  include flexlm

  flexlm::define::service {
    "mentor":
      binary_path  => "/pkgs/license/flexlm/current/lmgrd",
      license_path => "/pkgs/license/vendor/mentor/licenses/license.dat";
  }
}
