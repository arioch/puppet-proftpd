# == Class proftpd::params
#
class proftpd::params {
  # proftpd.conf
  $use_ipv6            = 'off'
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

  $load_modules = {
    ban => {
      enable => true,
    },
    ctrls_admin => {
      enable => true,
    },
    dynmasq => {
      enable => true,
    },
    exec => {
      enable => true,
    },
    facl => {
      enable => true,
    },
    load => {
      enable => true,
    },
    quotatab => {
      enable => true,
    },
    quotatab_file => {
      enable => true,
    },
    quotatab_radius => {
      enable => true,
    },
    radius => {
      enable => true,
    },
    ratio => {
      enable => true,
    },
    rewrite => {
      enable => true,
    },
    sftp => {
      enable => true,
    },
    sftp_pam => {
      enable => true,
    },
    shaper => {
      enable => true,
    },
    site_misc => {
      enable => true,
    },
    tls => {
      enable => true,
    },
    unique_id => {
      enable => true,
    },
    wrap => {
      enable => true,
    },
    wrap2 => {
      enable => true,
    },
    wrap2_file => {
      enable => true,
    },
    ifsession => {
      enable => true,
    },
  }

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
      $pkg_list          = 'proftpd-basic'
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

