# == Class proftpd
#
# === Parameters:
#
# $config_dir::           Location of the main configuration directory.
#                         Default: operating specific.
#
# $config_dir_mode::      Posix file mode for configuration files directory.
#                         Default: 0755.
#
# $config_file_mode::     Posix file mode for configuration files.
#                         Default: 0644.
#
# $config_group::         Posix group for configuration files.
#                         Default: operating specific.
#
# $config_user::          Posix user for configuration files.
#                         Default: operating specific.
#
# $daemon_group::         Unprivileged group to run daemon.
#                         Default: operating specific.
#
# $daemon_user::          Unprivileged user to run daemon.
#                         Default: operating specific.
#
# $load_modules::         Hash containing module names and settings.
#                         Default: list is too long, check params.pp.
#
# $log_dir::              Directory in which to log messages.
#                         Default: operating specific.
#
# $pid_file::             Path to file where the PID is written to.
#                         Default: operating specific.
#
# $pkg_ensure::           Ensure state for packages.
#                         Default: present.
#
# $pkg_list::             An array containing the main package and possibly
#                         a number of dependencies.
#                         Default: operating specific.
#
# $service_enable::       Enable/disable the daemon at boot time.
#                         Default: true.
#
# $service_ensure::       Ensure daemon state.
#                         Default: running.
#
# $service_hasrestart::   Specify whether or not the init script has restart.
#                         Default: operating specific.
#
# $service_hasstatus::    Specify whether or not the init script has status.
#                         Default: operating specific.
#
# $service_name::         Specify the name of the init script.
#                         Default: operating specific.
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
  class { 'proftpd::service': }

  if $::proftpd::load_modules {
    create_resources(proftpd::mod, $load_modules, {})
  }
}

