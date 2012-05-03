# Special Ubuntu things that prepare it to be a flexlm server.
class flexlm::ubuntu {
  # lmgrd expects to be able to use /usr/tmp. Ubuntu doesn't have a /usr/tmp.
  file {
    "/usr/tmp":
      ensure => symlink,
      target => "/tmp",
  }
  package {
    "lsb-core":
      ensure => installed;
  }
}
