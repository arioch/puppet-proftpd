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

Add modules to the node manifest:

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

A much more elegant approach when using large hashes would be to use Puppet's [automatic parameter lookup](http://docs.puppetlabs.com/hiera/1/puppet.html#automatic-parameter-lookup). <br>
Be aware that this is only possible when using Puppet => 3.0.0.

Your Hiera yaml file should look like this:

    ---
    proftpd::load_modules:
      ban:
        enable: true
      exec:
        enable: false
      load:
        enable: true
      quotatab:
        enable: false
      sftp:
        enable: true
      tls:
        enable: false

