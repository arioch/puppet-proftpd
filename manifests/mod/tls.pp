# = Class proftpd::mod::tls
#
class proftpd::mod::tls {
  notice 'Enabling module: tls'
  require ::proftpd::config

  file { "${::proftpd::config_dir}/tls.conf":
    content => template("proftpd/${::osfamily}/tls.conf.erb");
  }

}

