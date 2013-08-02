# == Class: pureftpd::params
#
# This class manages common server parameters for the pure-ftpd server
#
# === Parameters
#
# [*config_dir*]
# The storage area for the config files.
#
# [*package_name*]
# The name of the pure-ftpd package.
#
# [*service_name*]
# The name of the pure-ftpd service
#
# === TODO
#
# - Add debian support for the module
#
# === Authors
#
# 5Ub-Z3r0
#
class pureftpd::params inherits pureftpd {
  case $::osfamily {
    'RedHat':{
      $package_name = $pureftpd::use_selinux ?{
        true    => ['pure-ftpd', 'pure-ftpd-selinux'],
        default => 'pure-ftpd'
      }
      $config_dir      = '/etc/pure-ftpd'
      $service_name    = 'pure-ftpd'

      $conf_erb        = 'redhat/pure-ftpd.conf.erb'
      $conf_path       = "${config_dir}/pure-ftpd.conf"

      $ldap_conf_erb   = 'redhat/pureftpd-ldap.conf.erb'
      $ldap_conf_path  = "${config_dir}/pureftpd-ldap.conf"

      $mysql_conf_erb  = 'redhat/pureftpd-mysql.conf.erb'
      $mysql_conf_path = "${config_dir}/pureftpd-mysql.conf"

      $pgsql_conf_erb  = 'redhat/pureftpd-pgsql.conf.erb'
      $pgsql_conf_path = "${config_dir}/pureftpd-pgsql.conf"
    }
    default:{
      fail ("The module is not available for ${::os_family}")
    }
  }
}
