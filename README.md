Puppet pureftpd Module
======================

[![Build Status](https://travis-ci.org/jhoblitt/puppet-pureftpd.png)](https://travis-ci.org/jhoblitt/puppet-pureftpd)


Description
-----------

This is a puppet module for installation and configuration of the `pure-ftpd`
software.


Examples
--------

### Basic

Install `pure-ftpd` with an empty `pure-ftpd.conf` config file (accepting all
defaults) and start `pure-ftpd` as a stand alone daemon.

    class { 'pureftpd': }

### Selinux support

    class { 'pureftpd':
      use_selinux => true,
    }

### Setting configuration options

    class { 'pureftpd':
      use_selinux => true,
      config      => {
        ipv4only         => 'Yes',
        passiveportrange => '49999:59999',
      }
    }

### Enabling LDAP authentication

```
  pureftpd::config_ldap { 'ftp-server':
    ldap_server     => '192.168.100.10',
    ldap_basedn     => 'ou=Users,dc=company,dc=com',
    ldap_filter     => '(&(objectClass=posixAccount)(uid=\L))',
    ldap_authmethod => 'BIND'
    user_bandwidth  => '1800:1800'
  }
```
```
  pureftpd::config_pgsql { 'ftp-server':
    user_bandwidth  => '1800:1800'
  }
```

### TODO
- add a configuration switch for the pem certificate file, in case TLS is used
- Implement configuration variables for postgresql-based authentication
- Implement configuration variables for MySQL-based authentication
