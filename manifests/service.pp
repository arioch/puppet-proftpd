# == Class proftpd
#
class proftpd::service {
  service { $::proftpd::service_name:
    ensure     => $::proftpd::service_ensure,
    enable     => $::proftpd::service_enable,
    hasrestart => $::proftpd::service_hasrestart,
    hasstatus  => $::proftpd::service_hasstatus,
    require    => Class['::proftpd::config'];
  }
}

