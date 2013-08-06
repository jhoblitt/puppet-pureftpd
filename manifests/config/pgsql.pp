# == Class: pureftpd::config::pgsql
#
# This module manages the pure-ftpd configuration files with pgsql
# authentication
#
# === Authors
#
# 5Ub-Z3r0
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === TODO:
#
# - implement template and variables for the pgsql config file
#
class pureftpd::config::pgsql (
  $pgsqlserver         = undef,
  $pgsqlport           = undef,
  $pgsqluser           = undef,
  $pgsqlpassword       = undef,
  $pgsqldatabase       = undef,
  $pgsqlcrypt          = undef,
  $pgsqlgetpw          = undef,
  $pgsqlgetuid         = undef,
  $pgsqldefaultuid     = undef,
  $pgsqlgetgid         = undef,
  $pgsqldefaultgid     = undef,
  $pgsqlgetdir         = undef,
  $pgsqlgetqtafs       = undef,
  $pgsqlgetqtasz       = undef,
  $pgsqlgetratioul     = undef,
  $pgsqlgetratiodl     = undef,
  $pgsqlgetbandwidthul = undef,
  $pgsqlgetbandwidthdl = undef,
) inherits pureftpd::params {

  # pure-ftpd-1.0.30/src/log_pgsql_p.h
  $conf_options = [
    'PGSQLServer',
    'PGSQLPort',
    'PGSQLUser',
    'PGSQLPassword',
    'PGSQLDatabase',
    'PGSQLCrypt',
    'PGSQLGetPW',
    'PGSQLGetUID',
    'PGSQLDefaultUID',
    'PGSQLGetGID',
    'PGSQLDefaultGID',
    'PGSQLGetDir',
    'PGSQLGetQTAFS',
    'PGSQLGetQTASZ',
    'PGSQLGetRatioUL',
    'PGSQLGetRatioDL',
    'PGSQLGetBandwidthUL',
    'PGSQLGetBandwidthDL',
  ]

  file { $pureftpd::params::pgsql_conf_path:
    ensure  => file,
    content => template("${module_name}/${pureftpd::params::pgsql_conf_erb}"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
