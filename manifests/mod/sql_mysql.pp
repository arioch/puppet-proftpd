# == Class proftpd::mod::sql_mysql
#
class proftpd::mod::sql_mysql ($enable = true) {
  if $::osfamily == 'Debian' {
    file { "${::proftpd::config_dir}/sql.conf":
      content => template("proftpd/${::osfamily}/sql.conf.erb"),
      notify  => Service[$::proftpd::serivce_name],
    }

    # Include the config file in proftpd.conf.
    concat::fragment { "module_fragment_${name}":
      ensure  => present,
      target  => "${::proftpd::config_dir}/proftpd.conf",
      content => "Include /etc/proftpd/virtuals.conf \n",
      order   => '10',
    }
  }
}

