# = Class proftpd::mod::load
#
class proftpd::mod::ldap {
  notice 'Enabling module: ldap'
  require ::proftpd::config

  file { "${::proftpd::config_dir}/ldap.conf":
    content => template("proftpd/${::osfamily}/ldap.conf.erb"),
    notify  => Service[$::proftpd::serivce_name],
  }
}

