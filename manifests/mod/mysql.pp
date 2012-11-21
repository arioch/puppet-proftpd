# = Class proftpd::mod::mysql
#
class proftpd::mod::mysql {
  notice 'Enabling module: mysql'
  require ::proftpd::config
}

