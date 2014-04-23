# == Class proftpd
#
# === Parameters:
#
# $config_dir::           Location of the main configuration directory.
#                         Default: operating system specific.
#
# $config_dir_mode::      Posix file mode for configuration files directory.
#                         Default: 0755.
#
# $config_file_mode::     Posix file mode for configuration files.
#                         Default: 0644.
#
# $config_group::         Posix group for configuration files.
#                         Default: operating system specific.
#
# $config_user::          Posix user for configuration files.
#                         Default: operating system specific.
#
# $daemon_group::         Unprivileged group to run daemon.
#                         Default: operating system specific.
#
# $daemon_user::          Unprivileged user to run daemon.
#                         Default: operating system specific.
#
# $load_modules::         Hash containing module names and settings.
#                         Default: list is too long, check params.pp.
#
# $log_dir::              Directory in which to log messages.
#                         Default: operating system specific.
#
# $pid_file::             Path to file where the PID is written to.
#                         Default: operating system specific.
#
# $pkg_ensure::           Ensure state for packages.
#                         Default: present.
#
# $pkg_list::             An array containing the main package and possibly
#                         a number of dependencies.
#                         Default: operating system specific.
#
# $service_enable::       Enable/disable the daemon at boot time.
#                         Default: true.
#
# $service_ensure::       Ensure daemon state.
#                         Default: running.
#
# $service_hasrestart::   Specify whether or not the init script has restart.
#                         Default: operating system specific.
#
# $service_hasstatus::    Specify whether or not the init script has status.
#                         Default: operating system specific.
#
# $service_name::         Specify the name of the init script.
#                         Default: operating system specific.
#
class proftpd (
  $admincontrolsengine = $::proftpd::params::admincontrolsengine,
  $allowoverwrite      = $::proftpd::params::allowoverwrite,
  $config_dir          = $::proftpd::params::config_dir,
  $config_dir_mode     = $::proftpd::params::config_dir_mode,
  $config_file_mode    = $::proftpd::params::config_file_mode,
  $config_group        = $::proftpd::params::config_group,
  $config_user         = $::proftpd::params::config_user,
  $controlsengine      = $::proftpd::params::controlsengine,
  $controlsinterval    = $::proftpd::params::controlsinterval,
  $controlsmaxclients  = $::proftpd::params::controlsmaxclients,
  $controlssocket      = $::proftpd::params::controlssocket,
  $daemon_group        = $::proftpd::params::daemon_group,
  $daemon_user         = $::proftpd::params::daemon_user,
  $defaultroot         = $::proftpd::params::defaultroot,
  $defaultserver       = $::proftpd::params::defaultserver,
  $deferwelcome        = $::proftpd::params::deferwelcome,
  $delayengine         = $::proftpd::params::delayengine,
  $denyfilter          = $::proftpd::params::denyfilter,
  $displaychdir        = $::proftpd::params::displaychdir,
  $displaylogin        = $::proftpd::params::displaylogin,
  $identlookups        = $::proftpd::params::identlookups,
  $listen_port         = $::proftpd::params::listen_port,
  $listoptions         = $::proftpd::params::listoptions,
  $load_modules        = $::proftpd::params::load_modules,
  $log_dir             = $::proftpd::params::log_dir,
  $maxinstances        = $::proftpd::params::maxinstances,
  $multilinerfc2228    = $::proftpd::params::multilinerfc2228,
  $persistentpasswd    = $::proftpd::params::persistentpasswd,
  $pid_file            = $::proftpd::params::pid_file,
  $pkg_ensure          = $::proftpd::params::pkg_ensure,
  $pkg_list            = $::proftpd::params::pkg_list,
  $quotaengine         = $::proftpd::params::quotaengine,
  $ratios              = $::proftpd::params::ratios,
  $requirevalidshell   = $::proftpd::params::requirevalidshell,
  $servername          = $::proftpd::params::servername,
  $servertype          = $::proftpd::params::servertype,
  $service_enable      = $::proftpd::params::service_enable,
  $service_ensure      = $::proftpd::params::service_ensure,
  $service_hasstatus   = $::proftpd::params::service_hasstatus,
  $service_name        = $::proftpd::params::service_name,
  $showsymlinks        = $::proftpd::params::showsymlinks,
  $timeoutidle         = $::proftpd::params::timeoutidle,
  $timeoutnotransfer   = $::proftpd::params::timeoutnotransfer,
  $timeoutstalled      = $::proftpd::params::timeoutstalled,
  $use_ipv6            = $::proftpd::params::use_ipv6,
  $usesendfile         = $::proftpd::params::usesendfile,
) inherits proftpd::params {
  class { 'proftpd::install': } ->
  class { 'proftpd::config': } ->
  class { 'proftpd::service': }

  if $::proftpd::load_modules {
    create_resources(proftpd::mod, $load_modules, {})
  }
}

