# = Class proftpd
#
class proftpd (
  $config_dir        = $::proftpd::params::config_dir,
  $config_dir_mode   = $::proftpd::params::config_dir_mode,
  $config_file_mode  = $::proftpd::params::config_file_mode,
  $config_group      = $::proftpd::params::config_group,
  $config_user       = $::proftpd::params::config_user,
  $daemon_group      = $::proftpd::params::daemon_group,
  $daemon_user       = $::proftpd::params::daemon_user,
  $load_modules      = $::proftpd::params::load_modules,
  $log_dir           = $::proftpd::params::log_dir,
  $modules_enabled   = $::proftpd::params::modules_enabled,
  $pid_file          = $::proftpd::params::pid_file,
  $pkg_ensure        = $::proftpd::params::pkg_ensure,
  $pkg_list          = $::proftpd::params::pkg_list,
  $service_enable    = $::proftpd::params::service_enable,
  $service_ensure    = $::proftpd::params::service_ensure,
  $service_hasstatus = $::proftpd::params::service_hasstatus,
  $service_name      = $::proftpd::params::service_name,
) inherits proftpd::params {
  class { 'proftpd::install': } ->
  class { 'proftpd::config': } ->
  class { 'proftpd::service': } ->
  Class [ 'proftpd' ]

  if $::proftpd::load_modules {
    proftpd::mod { $::proftpd::load_modules:; }
  }
}

