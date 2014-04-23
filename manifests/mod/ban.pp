# == Class proftpd::mod::ban
#
class proftpd::mod::ban ($enable = true) {
  if $enable == true {
    $ensure = present
  } else {
    $ensure = absent
  }

  if $::osfamily == 'Debian' {
    # Load module .c file form modules.conf.
    concat::fragment { 'proftp_module_ban':
      ensure  => $ensure,
      target  => "${::proftpd::config_dir}/modules.conf",
      content => "LoadModule mod_ban.c \n",
      order   => '10',
    }
  }
}

