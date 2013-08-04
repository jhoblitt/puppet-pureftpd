# puppet-pureftpd

[![Build Status](https://travis-ci.org/jhoblitt/puppet-pureftpd.png)](https://travis-ci.org/jhoblitt/puppet-pureftpd)

Manage Pure-FTPd via Puppet on RHEL systems

## How to use

### Unix authentication with default configuration

```
  class { 'pureftpd': }
```

### Different authentication type

```
  pureftpd::config{ 'ftp':
    auth_type => mysql,
  }
```

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
