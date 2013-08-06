# == Class: pureftpd::config::mysql
#
# This module manages the pure-ftpd configuration files with mysql
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
# === TODO:
#
# - implement template and variables for the mysql config file
#

class pureftpd::config::mysql inherits pureftpd::params {

  file { $pureftpd::params::mysql_conf_path:
    ensure  => file,
    content => template("${module_name}/${pureftpd::params::mysql_conf_erb}"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
