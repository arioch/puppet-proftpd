# == Class proftpd::mod::load
#
class proftpd::mod::ldap ($enable = true) {
  if $::osfamily == 'Debian' {
    file { "${::proftpd::config_dir}/ldap.conf":
      content => template("proftpd/${::osfamily}/ldap.conf.erb"),
      notify  => Service[$::proftpd::serivce_name],
    }
  }
}

