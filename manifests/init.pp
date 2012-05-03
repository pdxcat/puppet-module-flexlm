# Begins initialization of a flexlm server.  Only very general
# stuff should ever makes its way into this class.  Operating
# system specifics go in their associated subclasses.  Actual
# license servers are described by subclasses; e.g. flexlm::comsol.

# A base class
class flexlm {
  case $operatingsystem {
    "Ubuntu":  { include flexlm::ubuntu  }
  }

  file {
    "flexlm-logdir":
      path   => "/var/log/flexlm",
      ensure => directory,
      owner  => "daemon",
      group  => "root",
      mode   => "644";
  }
}
