# = Class proftpd
#
class proftpd (
  config_dir        = $::proftpd::params::config_dir,
  config_group      = $::proftpd::params::config_group,
  config_mode       = $::proftpd::params::config_mode,
  config_user       = $::proftpd::params::config_user,
  daemon_group      = $::proftpd::params::daemon_group,
  daemon_user       = $::proftpd::params::daemon_user,
  log_dir           = $::proftpd::params::log_dir,
  pid_file          = $::proftpd::params::pid_file,
  pkg_ensure        = $::proftpd::params::pkg_ensure,
  pkg_list          = $::proftpd::params::pkg_list,
  service_enable    = $::proftpd::params::service_enable,
  service_ensure    = $::proftpd::params::service_ensure,
  service_hasstatus = $::proftpd::params::service_hasstatus,
  service_name      = $::proftpd::params::service_name
) inherits proftpd::params {

  include proftpd::install
  include proftpd::config
  include proftpd::service

  Class['proftpd::install'] ->
  Class['proftpd::config'] ->
  Class['proftpd::service']

}

