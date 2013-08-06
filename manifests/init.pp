# == Class: pureftpd
#
# This class installs, configures, and enables the pure-ftpd server
#
# === Parameters
#
# [*use_selinux*]
#   Optional, defaults to false.
#   Manages whether or not to enable the selinux extensions.
#
# [*config*]
#   Optional, defaults to `{}`.
#
# === Authors
#
# 5Ub-Z3r0
#
class pureftpd (
  $use_selinux  = false,
  $config       = {},
  $config_ldap  = {},
  $config_pgsql = {},
) {
  validate_bool($use_selinux)
  validate_hash($config)
  validate_hash($config_ldap)
  validate_hash($config_pgsql)

  include pureftpd::service

  class{ 'pureftpd::install': use_selinux => $use_selinux }

  unless (empty($config_ldap)) {
    # insert the path to the ldap conf file into pure-ftpd.conf
    $enable_ldap = { ldapconfigfile => $pureftpd::params::ldap_conf_path }

    # instantiate a pureftpd::config::ldap that will notify the service class
    $safe_config_ldap = merge($config,
      { notify => Class[ 'pureftpd::service' ] }
    )
    create_resources( 'class', { 'pureftpd::config::ldap' => $config_ldap } )

    # only try to create the ldap configuration file after the pureftpd package
    # is installed and configuration; otherwise the dir may not exist yet
    Class[ 'pureftpd::config' ] ->
    Class[ 'pureftpd::config::ldap' ]
  }

  unless (empty($config_pgsql)) {
    # insert the path to the pgsql conf file into pure-ftpd.conf
    $enable_pgsql = { pgsqlconfigfile => $pureftpd::params::pgsql_conf_path }

    # instantiate a pureftpd::config::mysql will notify the service class
    $safe_config_pgsql = merge($config,
      { notify => Class[ 'pureftpd::service' ] }
    )
    create_resources( 'class', { 'pureftpd::config::pgsql' => $config_pgsql } )

    # only try to create the pgsql configuration file after the pureftpd
    # package is installed and configuration; otherwise the dir may not exist
    # yet
    Class[ 'pureftpd::config' ] ->
    Class[ 'pureftpd::config::pgsql' ]
  }

  $safe_config = merge(
    $config,
    { notify => Class[ 'pureftpd::service' ] },
    $enable_ldap,
    $enable_pgsql
  )

  create_resources( 'class', { 'pureftpd::config' => $safe_config } )

  Class[ 'pureftpd::install' ] ->
  Class[ 'pureftpd::config' ] ->
  Class[ 'pureftpd::service' ] ->
  Class[ 'pureftpd' ]
}
