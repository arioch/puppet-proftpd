# == Define: proftpd::mod
#
define proftpd::mod ($enable = true) {
  if defined ("proftpd::mod::${name}") {
    class { "proftpd::mod::${name}":
      enable => $enable,
    }
  } else {
    # No additional configuration needed.
    # Load module .c file form modules.conf.
    concat::fragment { "proftp_module_${name}":
      ensure  => present,
      target  => "${::proftpd::config_dir}/modules.conf",
      content => "LoadModule mod_${name}.c \n",
      order   => '10',
    }
  }
}

