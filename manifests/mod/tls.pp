# == Class proftpd::mod::tls
#
class proftpd::mod::tls ($enable = true) {
  if $::osfamily == 'Debian' {
    file { "${::proftpd::config_dir}/tls.conf":
      content => template("proftpd/${::osfamily}/tls.conf.erb"),
      notify  => Service[$::proftpd::service_name],
    }

    # Include the config file in proftpd.conf
    concat::fragment { "module_fragment_${name}":
      ensure  => present,
      target  => "${::proftpd::config_dir}/proftpd.conf",
      content => "Include /etc/proftpd/virtuals.conf \n",
      order   => '10',
    }
  }
}

