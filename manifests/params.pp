# = Class proftpd::params
#
class proftpd::params {

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
      $service_enable    =
      $service_ensure    = running
      $service_hasstatus =
      $service_name      = ''
    }

    'Debian', 'Ubuntu': {
      $config_dir        = '/etc/proftpd'
      $config_dir_mode   = '0755'
      $config_file_mode  = '0644'
      $config_group      = 'root'
      $config_user       = 'root'
      $daemon_group      = ''
      $daemon_user       = ''
      $log_dir           = ''
      $pid_file          = ''
      $pkg_ensure        = present
      $pkg_list          = ''
      $service_enable    =
      $service_ensure    = running
      $service_hasstatus =
      $service_name      = ''
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported yet."
    }
  }

}

