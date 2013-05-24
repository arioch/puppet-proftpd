# == Class proftpd::install
#
class proftpd::install {
  package { $::proftpd::pkg_list:
    ensure => $::proftpd::pkg_ensure,
  }
}

