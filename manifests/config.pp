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
      content => template("proftpd/${::osfamily}/proftpd.conf.erb");

    "${::proftpd::config_dir}/modules.conf":
      content => template("proftpd/${::osfamily}/modules.conf.erb");

    "${::proftpd::config_dir}/virtuals.conf":
      content => template("proftpd/${::osfamily}/virtuals.conf.erb");
  }
}

