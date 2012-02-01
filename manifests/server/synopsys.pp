# The license server for Synopsys stuff
class flexlm::server::synopsys {
  include flexlm

  flexlm::define::service {
    "synopsys":
      binary_path  => "/pkgs/license/flexlm/current/lmgrd",
      license_path => "/pkgs/license/vendor/synopsys/licenses/lmsynopsys.lic";
  }
}
