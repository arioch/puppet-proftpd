# = Class proftpd::params
#
class proftpd::params {

  # proftpd.conf
  $use_ipv6            = 'on'
  $identlookups        = 'off'
  $servername          = $::fqdn
  $servertype          = 'standalone'
  $deferwelcome        = 'off'
  $multilinerfc2228    = 'on'
  $defaultserver       = 'on'
  $showsymlinks        = 'on'
  $timeoutnotransfer   = '600'
  $timeoutstalled      = '600'
  $timeoutidle         = '1200'
  $displaylogin        = 'welcome.msg'
  $displaychdir        = '.message true'
  $listoptions         = '-l'
  $denyfilter          = '\*.*/'
  $defaultroot         = '~'
  $listen_port         = '21'
  $requirevalidshell   = 'off'
  $maxinstances        = '30'
  $allowoverwrite      = 'on'
  $persistentpasswd    = 'off'
  $usesendfile         = 'off'
  $quotaengine         = 'off'
  $ratios              = 'off'
  $delayengine         = 'on'
  $controlsengine      = 'off'
  $controlsmaxclients  = '2'
  $controlsinterval    = '5'
  $controlssocket      = '/var/run/proftpd/proftpd.sock'
  $admincontrolsengine = 'off'

  $load_modules = [
    'mod_ban.c',
    'mod_ctrls_admin.c',
    'mod_dynmasq.c',
    'mod_exec.c',
    'mod_facl.c',
    'mod_load.c',
    'mod_quotatab.c',
    'mod_quotatab_file.c',
    'mod_quotatab_radius.c',
    'mod_radius.c',
    'mod_ratio.c',
    'mod_rewrite.c',
    'mod_sftp.c',
    'mod_sftp_pam.c',
    'mod_shaper.c',
    'mod_site_misc.c',
    'mod_tls.c',
    'mod_unique_id.c',
    'mod_vroot.c',
    'mod_wrap.c',
    'mod_wrap2.c',
    'mod_wrap2_file.c',
    'mod_ifsession.c'
  ]

  case $::operatingsystem {
    'RedHat', 'CentOS': {
      $config_dir        = ''
      $config_group      = 'root'
      $config_dir_mode   = '0755'
      $config_mode       = '0644'
      $config_user       = 'root'
      $daemon_group      = ''
      $daemon_user       = ''
      $log_dir           = ''
      $pid_file          = ''
      $pkg_ensure        = present
      $pkg_list          = ''
      $service_enable    = true
      $service_ensure    = running
      $service_hasstatus = ''
      $service_name      = ''
    }

    'Debian', 'Ubuntu': {
      $config_dir        = '/etc/proftpd'
      $config_dir_mode   = '0755'
      $config_file_mode  = '0644'
      $config_group      = 'root'
      $config_user       = 'root'
      $daemon_group      = 'nogroup'
      $daemon_user       = 'proftpd'
      $log_dir           = '/var/log/proftpd'
      $pid_file          = '/var/run/proftpd.pid'
      $pkg_ensure        = present
      $pkg_list          = 'proftpd'
      $service_enable    = true
      $service_ensure    = running
      $service_hasstatus = true
      $service_name      = 'proftpd'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported yet."
    }
  }

}

