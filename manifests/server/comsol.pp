# The license server for Dr. Sean Kohles special licenses
# See TTS #148294
# Base class included by the node
class flexlm::server::comsol {
  include flexlm
  flexlm::define::service {
    "comsol":
      binary_path  => "/pkgs/license/flexlm/current/lmgrd",
      license_path => "/pkgs/license/vendor/comsol/licenses/lmcomsol.lic";
  }
}
