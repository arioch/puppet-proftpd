# = Class proftpd::config
#
class proftpd::config {
  File {
    require => Class['::proftpd::install'],
    notify  => Service[$::proftpd::service_name],
    owner   => $::proftpd::config_user,
    group   => $::proftpd::config_group,
  }

  file {
    $::proftpd::config_dir:
      ensure => directory;

    $::proftpd::log_dir:
      ensure => directory,
      owner  => $::proftpd::daemon_user,
      group  => $::proftpd::daemon_group;
  }

}

