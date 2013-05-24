# Puppet ProFTPd

## Requirements

* [concat module](https://github.com/ripienaar/puppet-concat)


## Tested on...

* Debian 6 (Squeeze)
* Debian 7 (Wheezy)


## Example usage

### Install ProFTPd

    node /^ftp/ {
      include proftpd
    }


### Override default settings

    node /^ftp/ {
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


### Enable/disable modules

    node /^ftp/ {
      class { 'proftpd':
        load_modules => {
          ban => {
            enable => true,
          },
          exec => {
            enable => false,
          },
          load => {
            enable => true,
          },
          quotatab => {
            enable => false,
          },
          sftp => {
            enable => true,
          },
          tls => {
            enable => false,
          },
        }
      }
    }

