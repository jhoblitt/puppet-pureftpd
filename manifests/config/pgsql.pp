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

class pureftpd::config::pgsql inherits pureftpd::params {

  file { $pureftpd::params::pgsql_conf_path:
    ensure  => file,
    content => template("${module_name}/${pureftpd::params::pgsql_conf_erb}"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
