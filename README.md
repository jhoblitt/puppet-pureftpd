Puppet pureftpd Module
======================

[![Build Status](https://travis-ci.org/jhoblitt/puppet-pureftpd.png)](https://travis-ci.org/jhoblitt/puppet-pureftpd)

#### Table of Contents

1. [Overview](#overview)
2. [Description](#description)
    * [Forked](#forked)
3. [Usage](#usage)
    * [`pure-ftpd` Options](#pure-ftpd-options)
    * [Basic Usage](#basic-usage)
    * [SELinux Support](#selinux-support)
    * [Setting Configuration Options](#setting-configuration options)
    * [Enabling LDAP Authentication](#enabling-ldap-authentication)
    * [Enabling MYSQL Authentication](#enabling-mysql-authentication)
    * [Enabling PGSQL Authentication](#enabling-pgsql-authentication)
4. [Limitations](#limitations)
    * [`stdlib`](#stdlib)
    * [Tested Platforms](#tested-platforms)
5. [Support](#support)


Overview
--------

Manages the pure-ftpd package with comprehensive configuration support


Description
-----------

This is a puppet module for installation and configuration of the
[`pure-ftpd`](http://www.pureftpd.org/project/pure-ftpd) software package.  It
aims to support all valid configuration file values.

### Forked

This module started out as a fork of
[`5Ub-Z3r0/puppet-pureftpd`](https://github.com/5Ub-Z3r0/puppet-pureftpd) but
has been so heavily redesigned over time that it's probably not reasonable to
blame any of the design or implementation on
[`5Ub-Z3r0`](https://github.com/5Ub-Z3r0).  It would also be exceptionally
difficult to re-unify the two modules due to fundamental API differences.

The original module was marked as being licensed under `GPLv3` in comments and
no `LICENSE` file was present.  Very little to none of the original module code
remains in the present version of this module.  All contributions by `Joshua
Hoblitt` are licensed under `Apache License, Version 2.0`.  You should consult
with a lawyer for a legal opinion as to weather or not this module constitutes
a derived work.


Usage
-----

In general, any valid `pure-ftpd` configuration file option (including the
separate configuration files for auth modules) can be set by creating a key in
the appropriate class parameter hash but with the name of the option
transliterated to *lowercase*.  The values passed to that option are handled
completely as raw strings but this module.  No effort is made to handle
`boolean` or `integer` values as `pure-ftpd` itself is not consistent in how it
handles these values.

For example, if you wanted to create the configuration option example below in
the file `/etc/pure-ftpd/pure-ftpd.conf`:

    ChrootEveryone yes

You would declare it like this to the `pureftpd` module:

    class { 'pureftpd':
      config => {
        chrooteveryone => 'yes',
      }
    }

The notable exception to that rule is for these `pure-ftpd.conf` options, which
should not need to be manually declared.  Passing a hash of configuration
options to the appropriate class parameter automatically defines these options
for you.

    LDAPConfigFile
    MySQLConfigFile
    PGSQLConfigFile


### `pure-ftpd` Options

The `pure-ftpd` documentation does not provide a canonical list of all possible
configuration options with examples.  However, there are number of "HOW TO"s on
the official [documentation](http://www.pureftpd.org/project/pure-ftpd/doc) web
page.

There is a list of command line switches in the distribution's
[`README`](https://github.com/jedisct1/pure-ftpd/blob/master/README) that
should all have `pure-ftpd.conf` option analogs.

Here are some useful sources for discovering configuration parameters with
examples:

* [`pure-ftpd.conf`](https://github.com/jedisct1/pure-ftpd/blob/master/configuration-file/pure-ftpd.conf.in)
* [`pureftpd-ldap.conf`](https://github.com/jedisct1/pure-ftpd/blob/master/pureftpd-ldap.conf)
* [`pureftpd-mysql.conf`](https://github.com/jedisct1/pure-ftpd/blob/master/pureftpd-mysql.conf)
* [`pureftpd-pgsql.conf`](https://github.com/jedisct1/pure-ftpd/blob/master/pureftpd-pgsql.conf)

### Basic Usage

Install the `pure-ftpd` package with an empty `pure-ftpd.conf` config file
(accepting all defaults) and start `pure-ftpd` as a stand alone daemon.

    class { 'pureftpd': }

### SELinux Support

    class { 'pureftpd':
      use_selinux => true,
    }

### Setting Configuration Options

Options for `pure-ftpd.conf` should be passed into the `config` class parameter
as a hash.

    class { 'pureftpd':
      config => {
        ipv4only                   => 'yes',
        ipv6only                   => 'yes',
        chrooteveryone             => 'yes',
        brokenclientscompatibility => 'no',
        daemonize                  => 'yes',
        verboselog                 => 'no',
        displaydotfiles            => 'yes',
        anonymousonly              => 'no',
        noanonymous                => 'no',
        dontresolve                => 'yes',
        anonymouscancreatedirs     => 'no',
        natmode                    => 'no',
        calluploadscript           => 'yes',
        antiwarez                  => 'yes',
        allowuserfxp               => 'no',
        allowanonymousfxp          => 'no',
        prohibitdotfileswrite      => 'no',
        prohibitdotfilesread       => 'no',
        allowdotfiles              => 'no',
        autorename                 => 'no',
        anonymouscantupload        => 'no',
        logpid                     => 'yes',
        nochmod                    => 'yes',
        keepallfiles               => 'yes',
        createhomedir              => 'yes',
        norename                   => 'yes',
        customerproof              => 'yes',
        notruncate                 => 'yes',
        filesystemcharset          => 'big5',
        clientcharset              => 'big5',
        syslogfacility             => 'ftp',
        fortunesfile               => '/usr/share/fortune/zippy',
        forcepassiveip             => '192.168.0.1',
        bind                       => '127.0.0.1,21',
        anonymousbandwidth         => '8',
        userbandwidth              => '8',
        trustedip                  => '10.1.1.1',
        altlog                     => 'w3c:/var/log/pureftpd.log',
        pidfile                    => '/var/run/pure-ftpd.pid',
        tlsciphersuite             => 'HIGH:MEDIUM:+TLSv1:!SSLv2:+SSLv3',
        maxidletime                => '15',
        maxdiskusage               => '99',
        trustedgid                 => '100',
        maxclientsnumber           => '50',
        maxclientsperip            => '8',
        maxload                    => '4',
        minuid                     => '100',
        tls                        => '1',
        limitrecursion             => '10000 8',
        passiveportrange           => '30000 50000',
        anonymousratio             => '1 10',
        userratio                  => '1 10',
        umask                      => '133:022',
        quota                      => '1000:10',
        peruserlimits              => '3:20',
        ldapconfigfile             => '/etc/pureftpd-ldap.conf',
        mysqlconfigfile            => '/etc/pureftpd-mysql.conf',
        pgsqlconfigfile            => '/etc/pureftpd-pgsql.conf',
        puredb                     => '/etc/pureftpd.pdb',
        extauth                    => '/var/run/ftpd.sock',
        unixauthentication         => 'yes',
        pamauthentication          => 'yes',
      },
    }

### Enabling LDAP Authentication

Options for `pureftpd-ldap.conf` should be passed into the `config_ldap` class
parameter as a hash.

    class { 'pureftpd':
      config_ldap => {
        ldapserver      => 'ldap.example.com',
        ldapauthmethod  => 'PASSWORD',
        ldapport        => '389',
        ldapbinddn      => 'cn=Manager,dc=c9x,dc=org',
        ldapbindpw      => 'r00tPaSsw0rD',
        ldapbasedn      => 'cn=Users,dc=c9x,dc=org',
        ldapfilter      => '(&(objectClass=posixAccount)(uid=\L))',
        ldaphomedir     => 'homeDirectory',
        ldapversion     => '3',
        ldapdefaultuid  => '100',
        ldapdefaultgid  => '100',
        ldapusetls      => 'False',
        ldapauthmethod  => 'PASSWORD',
      },
    }

### Enabling MYSQL Authentication

Options for `pureftpd-mysql.conf` should be passed into the `config_mysql`
class parameter as a hash.

    class { 'pureftpd':
      config_mysql => {
        mysqlserver              => 'localhost'
        mysqlport                => '3306'
        mysqlsocket              => '/tmp/mysql.sock'
        mysqluser                => 'root'
        mysqlpassword            => 'rootpw'
        mysqldatabase            => 'pureftpd'
        mysqlcrypt               => 'cleartext'
        mysqltransactions        => 'On'
        mysqlgetpw               => 'SELECT Password FROM users WHERE User="\L"'
        mysqlgetuid              => 'SELECT Uid FROM users WHERE User="\L"'
        mysqldefaultuid          => '1000'
        mysqlgetgid              => 'SELECT Gid FROM users WHERE User="\L"'
        mysqldefaultgid          => '1000'
        mysqlgetdir              => 'SELECT Dir FROM users WHERE User="\L"'
        mysqlforcetildeexpansion => '0'
        mysqlgetqtafs            => 'SELECT QuotaFiles FROM users WHERE User="\L"'
        mysqlgetqtasz            => 'SELECT QuotaSize FROM users WHERE User="\L"'
        mysqlgetratioul          => 'SELECT ULRatio FROM users WHERE User="\L"'
        mysqlgetratiodl          => 'SELECT DLRatio FROM users WHERE User="\L"'
        mysqlgetbandwidthul      => 'SELECT ULBandwidth FROM users WHERE User="\L"'
        mysqlgetbandwidthdl      => 'SELECT DLBandwidth FROM users WHERE User="\L"'
      },
    }

### Enabling PGSQL Authentication

Options for `pureftpd-pgsql.conf` should be passed into the `config_pgsql`
class parameter as a hash.

    class { 'pureftpd':
      config_pgsql => {
        pgsqlserver         => 'localhost',
        pgsqlport           => '5432',
        pgsqluser           => 'postgres',
        pgsqlpassword       => 'rootpw',
        pgsqldatabase       => 'pureftpd',
        pgsqlcrypt          => 'cleartext',
        pgsqlgetpw          => 'SELECT Password FROM users WHERE User=\'\L\'',
        pgsqlgetuid         => 'SELECT Uid FROM users WHERE User=\'\L\'',
        pgsqldefaultuid     => '1000',
        pgsqlgetgid         => 'SELECT Gid FROM users WHERE User=\'\L\'',
        pgsqldefaultgid     => '1000',
        pgsqlgetdir         => 'SELECT Dir FROM users WHERE User=\'\L\'',
        pgsqlgetqtafs       => 'SELECT QuotaFiles FROM users WHERE User=\'\L\'',
        pgsqlgetqtasz       => 'SELECT QuotaSize FROM users WHERE User=\'\L\'',
        pgsqlgetratioul     => 'SELECT ULRatio FROM users WHERE User=\'\L\'',
        pgsqlgetratiodl     => 'SELECT DLRatio FROM users WHERE User=\'\L\'',
        pgsqlgetbandwidthul => 'SELECT ULBandwidth FROM users WHERE User=\'\L\'',
        pgsqlgetbandwidthdl => 'SELECT DLBandwidth FROM users WHERE User=\'\L\'',
      },
    }

### Pedantic Example

    class { 'pureftpd':
      use_selinux  => true,
      config       => {
        ipv4only                   => 'yes',
        ipv6only                   => 'yes',
        chrooteveryone             => 'yes',
        brokenclientscompatibility => 'no',
        daemonize                  => 'yes',
        verboselog                 => 'no',
        displaydotfiles            => 'yes',
        anonymousonly              => 'no',
        noanonymous                => 'no',
        dontresolve                => 'yes',
        anonymouscancreatedirs     => 'no',
        natmode                    => 'no',
        calluploadscript           => 'yes',
        antiwarez                  => 'yes',
        allowuserfxp               => 'no',
        allowanonymousfxp          => 'no',
        prohibitdotfileswrite      => 'no',
        prohibitdotfilesread       => 'no',
        allowdotfiles              => 'no',
        autorename                 => 'no',
        anonymouscantupload        => 'no',
        logpid                     => 'yes',
        nochmod                    => 'yes',
        keepallfiles               => 'yes',
        createhomedir              => 'yes',
        norename                   => 'yes',
        customerproof              => 'yes',
        notruncate                 => 'yes',
        filesystemcharset          => 'big5',
        clientcharset              => 'big5',
        syslogfacility             => 'ftp',
        fortunesfile               => '/usr/share/fortune/zippy',
        forcepassiveip             => '192.168.0.1',
        bind                       => '127.0.0.1,21',
        anonymousbandwidth         => '8',
        userbandwidth              => '8',
        trustedip                  => '10.1.1.1',
        altlog                     => 'w3c:/var/log/pureftpd.log',
        pidfile                    => '/var/run/pure-ftpd.pid',
        tlsciphersuite             => 'HIGH:MEDIUM:+TLSv1:!SSLv2:+SSLv3',
        maxidletime                => '15',
        maxdiskusage               => '99',
        trustedgid                 => '100',
        maxclientsnumber           => '50',
        maxclientsperip            => '8',
        maxload                    => '4',
        minuid                     => '100',
        tls                        => '1',
        limitrecursion             => '10000 8',
        passiveportrange           => '30000 50000',
        anonymousratio             => '1 10',
        userratio                  => '1 10',
        umask                      => '133:022',
        quota                      => '1000:10',
        peruserlimits              => '3:20',
        ldapconfigfile             => '/etc/pureftpd-ldap.conf',
        mysqlconfigfile            => '/etc/pureftpd-mysql.conf',
        pgsqlconfigfile            => '/etc/pureftpd-pgsql.conf',
        puredb                     => '/etc/pureftpd.pdb',
        extauth                    => '/var/run/ftpd.sock',
        unixauthentication         => 'yes',
        pamauthentication          => 'yes',
      },
      config_ldap  => {
        ldapserver      => 'ldap.example.com',
        ldapauthmethod  => 'PASSWORD',
        ldapport        => '389',
        ldapbinddn      => 'cn=Manager,dc=c9x,dc=org',
        ldapbindpw      => 'r00tPaSsw0rD',
        ldapbasedn      => 'cn=Users,dc=c9x,dc=org',
        ldapfilter      => '(&(objectClass=posixAccount)(uid=\L))',
        ldaphomedir     => 'homeDirectory',
        ldapversion     => '3',
        ldapdefaultuid  => '100',
        ldapdefaultgid  => '100',
        ldapusetls      => 'False',
        ldapauthmethod  => 'PASSWORD',
      },
      config_mysql => {
        mysqlserver              => 'localhost'
        mysqlport                => '3306'
        mysqlsocket              => '/tmp/mysql.sock'
        mysqluser                => 'root'
        mysqlpassword            => 'rootpw'
        mysqldatabase            => 'pureftpd'
        mysqlcrypt               => 'cleartext'
        mysqltransactions        => 'On'
        mysqlgetpw               => 'SELECT Password FROM users WHERE User="\L"'
        mysqlgetuid              => 'SELECT Uid FROM users WHERE User="\L"'
        mysqldefaultuid          => '1000'
        mysqlgetgid              => 'SELECT Gid FROM users WHERE User="\L"'
        mysqldefaultgid          => '1000'
        mysqlgetdir              => 'SELECT Dir FROM users WHERE User="\L"'
        mysqlforcetildeexpansion => '0'
        mysqlgetqtafs            => 'SELECT QuotaFiles FROM users WHERE User="\L"'
        mysqlgetqtasz            => 'SELECT QuotaSize FROM users WHERE User="\L"'
        mysqlgetratioul          => 'SELECT ULRatio FROM users WHERE User="\L"'
        mysqlgetratiodl          => 'SELECT DLRatio FROM users WHERE User="\L"'
        mysqlgetbandwidthul      => 'SELECT ULBandwidth FROM users WHERE User="\L"'
        mysqlgetbandwidthdl      => 'SELECT DLBandwidth FROM users WHERE User="\L"'
      },
      config_pgsql => {
        pgsqlserver         => 'localhost',
        pgsqlport           => '5432',
        pgsqluser           => 'postgres',
        pgsqlpassword       => 'rootpw',
        pgsqldatabase       => 'pureftpd',
        pgsqlcrypt          => 'cleartext',
        pgsqlgetpw          => 'SELECT Password FROM users WHERE User=\'\L\'',
        pgsqlgetuid         => 'SELECT Uid FROM users WHERE User=\'\L\'',
        pgsqldefaultuid     => '1000',
        pgsqlgetgid         => 'SELECT Gid FROM users WHERE User=\'\L\'',
        pgsqldefaultgid     => '1000',
        pgsqlgetdir         => 'SELECT Dir FROM users WHERE User=\'\L\'',
        pgsqlgetqtafs       => 'SELECT QuotaFiles FROM users WHERE User=\'\L\'',
        pgsqlgetqtasz       => 'SELECT QuotaSize FROM users WHERE User=\'\L\'',
        pgsqlgetratioul     => 'SELECT ULRatio FROM users WHERE User=\'\L\'',
        pgsqlgetratiodl     => 'SELECT DLRatio FROM users WHERE User=\'\L\'',
        pgsqlgetbandwidthul => 'SELECT ULBandwidth FROM users WHERE User=\'\L\'',
        pgsqlgetbandwidthdl => 'SELECT DLBandwidth FROM users WHERE User=\'\L\'',
      },
    }


Limitations
-----------

At present, this module is only capable of installing the `pure-ftpd` package
and enabling it as a daemonized service.  The lack of uninstallation support is
probably a bug.

Only support for `$::osfamily == 'RedHat'` has been implemented.  Adding
support for other platform should be trivial but needs to involve full up
integration testing.

The supported configuration file values were discovered via code inspection of
the `pure-ftpd` `v1.0.31` release.  There are possibly new configuration values
that have been introduced in subsequent releases.  Any configuration values
present in a stable `pure-ftpd` release but not supported by this module should
be considered a bug.

### `stdlib` 

This module is dependent upon this patch to the [`merge`
function](https://github.com/puppetlabs/puppetlabs-stdlib/commit/f496005bf3db8a5202bf9c16daf9a524b178c67a)
in `stdlib`, which as of 2013-09-22 is not part of a stable `stdlib` release.
The present latest version is `4.1.0` and presumably the required patch will be
part of a `4.1.1` or `4.2.0` release.

### Tested Platforms

* el6.x


Support
-------

Please log tickets and issues at
[github](https://github.com/jhoblitt/puppet-pureftpd/issues)

