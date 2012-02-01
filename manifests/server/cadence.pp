# The license server for Mentor stuff
class flexlm::server::cadence {
  include flexlm

  flexlm::define::service {
    "cadence":
      binary_path  => "/pkgs/license/flexlm/current/lmgrd",
      license_path => "/pkgs/license/vendor/cadence/licenses/lmcadence.lic";
  }
}
