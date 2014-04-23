# == Class proftpd::config
#
class proftpd::config {
  File {
    ensure  => present,
    require => Class['::proftpd::install'],
    notify  => Service[$::proftpd::service_name],
    mode    => $::proftpd::config_file_mode,
    owner   => $::proftpd::config_user,
    group   => $::proftpd::config_group,
  }

  file { $::proftpd::log_dir:
    ensure => directory;
  }

  if $::osfamily == 'RedHat' {
    file { $::proftpd::config_file:
      ensure => present,
      mode   => $::proftpd::config_mode;
    }
  }

  if $::osfamily == 'Debian' {
    file {
      $::proftpd::config_dir:
        ensure => directory,
        mode   => $::proftpd::config_dir_mode;

      "${::proftpd::config_dir}/virtuals.conf":
        content => template("proftpd/${::osfamily}/virtuals.conf.erb");
    }

    concat { "${::proftpd::config_dir}/proftpd.conf":
      owner => $::proftpd::config_user,
      group => $::proftpd::config_group,
    }

    concat { "${::proftpd::config_dir}/modules.conf":
      owner => $::proftpd::config_user,
      group => $::proftpd::config_group,
    }

    concat::fragment { 'proftp_config_header':
      ensure  => present,
      target  => "${::proftpd::config_dir}/proftpd.conf",
      content => template("proftpd/${::osfamily}/proftpd.conf.erb"),
      order   => '01',
    }

    concat::fragment { 'proftp_modules_header':
      ensure  => present,
      target  => "${::proftpd::config_dir}/modules.conf",
      content => template("proftpd/${::osfamily}/modules.conf.erb"),
      order   => '01',
    }
  }
}

