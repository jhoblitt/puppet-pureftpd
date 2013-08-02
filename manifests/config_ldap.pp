# == Define: pureftpd::config
#
# This module manages the pure-ftpd configuration files with LDAP authentication
#
# === Parameters
#
# [*ldap_server*]
#  Mandatory, is the IP or FQDN of the LDAP server
#
# [*ldap_basedn*]
#  Mandatory, is the base DN of the LDAP tree where the users are stored
#  (e.g.: ou=People,dc=company,dc=com)
#
# [*ldap_filter*]
#  Mandatory, specifies a filter that can be used to filter out users
#  (e.g.: '(&(objectClass=posixAccount)(uid=\L))')
#
# [*ldap_port*]
#  Optional, defaults to 389
#  The server port where the ldap service listens
#
# [*ldap_authmethod*]
#  Mandatory, can either be BIND or password
#  Manages the authentication methof for the LDAP users.
#
# [*$ldap_binddn*]
#  Optional, defaults to "".
#  the binddn that will be used to connect to the tree; leave blank if LDAP
#  supports anonymous bind.
#
# [*ldap_bindpw*]
#  Optional, defaults to "".
#  the binddn pass that will be used to connect to the tree; leave blank if LDAP
#  supports anonymous bind.
#
# [*ldap_usetls*]
#  Optional, defaults to false.
#  Defines whether or not to use a TLS connection to the LDAP service.
#
# [*use_selinux*]
#  Optional, defaults to false.
#  Manages whether or not to enable selinux extensions.
#
#  [*allow_anonymous*]
#  Optional, defaults to false.
#  Manages whether or not to allow anonymous users.
#
# [*allow_fxp*]
#  Optional, defaults to false.
#  Manages whether or not to allow the fxp protocol
#
# [*user_bandwidth*]
#  Optional, defaults to undef.
#  Defines the maximum bandwidth that the can be used, in the form
#  $kb_download:$kb_upload (e.g., 1800:1800).
#
# [*max_clients_number*]
#  Optional, defaults to 50.
#  Maximum number of simultaneous users that the server can manage.
#
# [*max_clients_per_ip*]
#  Optional, defaults to 8.
#  Maximum number of different clients that can come from a single IP
#
# [*umask*]
#  Optional, defaults to 133:022.
#  Specifies the user mask of the uploaded files/directories, in the form
#  $file_umask:$dir_umask (e.g., 177:077).
#
# [*min_uid*]
#  Optional, defaults to 500.
#  The minimum user id that can be accepted as an ftp user.
#
# [*allow_chmod*]
#  Optional, defaults to false.
#  Whether or not users are allowed to change ownerships of their files.
#
# [*use_tls*]
#  Optional, defaults to false.
#  Whether or not to accept tls connections in addition to normal ones.
#  TODO: Remember to place your server certificate in  /etc/ssl/private/pure-ftpd.pem
#
# [*force_passive_ip*]
#  Optional, defaults to undef (not set)
#  Force an IP address in PASV/EPSV/SPSV replies
#
# [*motd_file*]
#  Optional, defaults to undef (use the dynamic provided file).
#  Manages the location of the server motd file, if any.
#
# === Examples
#
# pureftpd::config_ldap { 'ftp-server':
#   ldap_server     => '192.168.100.10',
#   ldap_basedn     => 'ou=Users,dc=company,dc=com',
#   ldap_filter     => '(&(objectClass=posixAccount)(uid=\L))',
#   ldap_authmethod => 'BIND'
#   user_bandwidth  => '1800:1800'
# }
#
# === Authors
#
# 5Ub-Z3r0
#
class pureftpd::config_ldap (
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
  $ldap_conf_options = [
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
    notify  => Service[$pureftpd::params::service_name]
  }
}
