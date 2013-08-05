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

    class { 'pureftpd':
      use_selinux => true,
      config      => {
        ipv4only         => 'Yes',
        passiveportrange => '49999:59999',
      }
      config_ldap => {
        $ldapserver      => 'ldap.example.com',
        $ldapauthmethod  => 'PASSWORD',
        $ldapport        => '389',
        $ldapbinddn      => 'cn=Manager,dc=c9x,dc=org',
        $ldapbindpw      => 'r00tPaSsw0rD',
        $ldapbasedn      => 'cn=Users,dc=c9x,dc=org',
        $ldapfilter      => '(&(objectClass=posixAccount)(uid=\L))',
        $ldaphomedir     => 'homeDirectory',
        $ldapversion     => '3',
        $ldapdefaultuid  => '100',
        $ldapdefaultgid  => '100',
        $ldapdefaultgid  => '100',
        $ldapusetls      => 'False',
        $ldapauthmethod  => 'PASSWORD',
      }
    }

### TODO
- add a configuration switch for the pem certificate file, in case TLS is used
- Implement configuration variables for postgresql-based authentication
- Implement configuration variables for MySQL-based authentication
