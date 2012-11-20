# Puppet ProFTPd

## Tested on...

* Debian 6 (Squeeze)

## Example usage

### Install ProFTPd

    node /ftp/ {
      include proftpd
    }

### Override default settings

    node /ftp/ {
      class { 'proftpd':
        use_ipv6          => 'on',
        identlookups      => 'on',
        showsymlinks      => 'on',
        timeoutnotransfer => '600',
        timeoutstalled    => '600',
        timeoutidle       => '1200',
        listen_port       => '21',
      }
    }

