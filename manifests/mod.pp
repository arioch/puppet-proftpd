# == Define: proftpd::mod
#
define proftpd::mod {
  class {
    "proftpd::mod::${name}":;
  }
}

