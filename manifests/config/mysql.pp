# == Class: pureftpd::config::mysql
#
# Manages the `pureftpd-mysql.conf` file.  This class should be considered
# private.
#
#
class pureftpd::config::mysql (
  $mysqlserver                = undef,
  $mysqlport                  = undef,
  $mysqlsocket                = undef,
  $mysqluser                  = undef,
  $mysqlpassword              = undef,
  $mysqldatabase              = undef,
  $mysqlcrypt                 = undef,
  $mysqltransactions          = undef,
  $mysqlgetpw                 = undef,
  $mysqlgetuid                = undef,
  $mysqldefaultuid            = undef,
  $mysqlgetgid                = undef,
  $mysqldefaultgid            = undef,
  $mysqlgetdir                = undef,
  $mysqlforcetildeexpansion   = undef,
  $mysqlgetqtafs              = undef,
  $mysqlgetqtasz              = undef,
  $mysqlgetratioul            = undef,
  $mysqlgetratiodl            = undef,
  $mysqlgetbandwidthul        = undef,
  $mysqlgetbandwidthdl        = undef,
) inherits pureftpd::params {

  # options taken from pure-ftpd-1.0.30/configuration-file/log_mysql_p.h
  $conf_options = [
    'MYSQLServer',
    'MYSQLPort',
    'MYSQLSocket',
    'MYSQLUser',
    'MYSQLPassword',
    'MYSQLDatabase',
    'MYSQLCrypt',
    'MYSQLTransactions',
    'MYSQLGetPW',
    'MYSQLGetUID',
    'MYSQLDefaultUID',
    'MYSQLGetGID',
    'MYSQLDefaultGID',
    'MYSQLGetDir',
    'MYSQLForceTildeExpansion',
    'MYSQLGetQTAFS',
    'MYSQLGetQTASZ',
    'MYSQLGetRatioUL',
    'MYSQLGetRatioDL',
    'MYSQLGetBandwidthUL',
    'MYSQLGetBandwidthDL',
  ]

  file { $pureftpd::params::mysql_conf_path:
    ensure  => file,
    content => template("${module_name}/${pureftpd::params::mysql_conf_erb}"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
