# == Class: pureftpd::config::ldap
#
# Manages the `pureftpd-ldap.conf` file.  This class should be considered
# private.
#
#
class pureftpd::config::ldap (
  $ldapserver          = undef,
  $ldapport            = undef,
  $ldapbinddn          = undef,
  $ldapbindpw          = undef,
  $ldapbasedn          = undef,
  $ldapfilter          = undef,
  $ldaphomedir         = undef,
  $ldapversion         = undef,
  $ldapdefaultuid      = undef,
  $ldapforcedefaultuid = undef,
  $ldapdefaultgid      = undef,
  $ldapforcedefaultgid = undef,
  $ldapusetls          = undef,
  $ldapauthmethod      = undef,
) inherits pureftpd::params {

  # options taken from pure-ftpd-1.0.30/src/log_ldap_p.h
  # XXX The options LDAPForceDefaultUID & LDAPForceDefaultGID are non-mainline
  # additions to pure-ftpd.  It is hoped that these will be merged into a
  # future offical release.
  # https://github.com/jhoblitt/pure-ftpd/commit/bb03ca57fb087bb03a6c8a69fe160e87c0d9c5e8
  $conf_options = [
    'LDAPServer',
    'LDAPPort',
    'LDAPBindDN',
    'LDAPBindPW',
    'LDAPBaseDN',
    'LDAPFilter',
    'LDAPHomeDir',
    'LDAPVersion',
    'LDAPDefaultUID',
    'LDAPForceDefaultUID',
    'LDAPDefaultGID',
    'LDAPForceDefaultGID',
    'LDAPUseTLS',
    'LDAPAuthMethod',
  ]

  file { $pureftpd::params::ldap_conf_path:
    ensure  => file,
    content => template("${module_name}/${pureftpd::params::ldap_conf_erb}"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
