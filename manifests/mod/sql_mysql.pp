# = Class proftpd::mod::sql_mysql
#
class proftpd::mod::sql_mysql {
  notice 'Enabling module: sql_mysql'
  require ::proftpd::config

  file { "${::proftpd::config_dir}/sql.conf":
    content => template("proftpd/${::osfamily}/sql.conf.erb"),
    notify  => Service[$::proftpd::serivce_name],
  }

}

