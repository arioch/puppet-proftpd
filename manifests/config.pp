# = Class proftpd::config
#
class proftpd::config {
  File {
    ensure  => present,
    require => Class['::proftpd::install'],
    notify  => Service[$::proftpd::service_name],
    owner   => $::proftpd::config_user,
    group   => $::proftpd::config_group,
  }

  file {
    $::proftpd::config_dir:
      ensure => directory;

    $::proftpd::log_dir:
      ensure => directory;

    "${::proftpd::config_dir}/proftpd.conf":
      content => template("proftpd/proftpd.conf.${::osfamily}.erb");

    "${::proftpd::config_dir}/modules.conf":;

    "${::proftpd::config_dir}/sql.conf":;

    "${::proftpd::config_dir}/tls.conf":;

    "${::proftpd::config_dir}/virtuals.conf":;

    "${::proftpd::config_dir}/ldap.conf":;

  }

}

