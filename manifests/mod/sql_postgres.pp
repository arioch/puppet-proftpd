# = Class proftpd::mod::sql_postgres
#
class proftpd::mod::sql_postgres {
  notice 'Enabling module: sql_postgres'
  require ::proftpd::config

  file { "${::proftpd::config_dir}/sql.conf":
    content => template("proftpd/${::osfamily}/sql.conf.erb"),
    notify  => Service[$::proftpd::serivce_name],
  }

}

