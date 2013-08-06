# == Class: pureftpd::config::ldap
#
# This module manages the pure-ftpd configuration files with LDAP
# authentication
#
# === Parameters
#
#
# === Authors
#
# 5Ub-Z3r0
# Joshua Hoblitt <jhoblitt@cpan.org>
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

  # the complete list of options is defined in pure-ftpd/src/log_ldap_p.h
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
