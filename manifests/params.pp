# == Class: pureftpd::params
#
# This class should be considered private.
#
#
class pureftpd::params {
  case $::osfamily {
    'RedHat': {
      $package_name         = 'pure-ftpd'
      $package_name_selinux = ['pure-ftpd', 'pure-ftpd-selinux']

      $config_dir      = '/etc/pure-ftpd'
      $service_name    = 'pure-ftpd'

      $conf_erb        = 'pure-ftpd.conf.erb'
      $conf_path       = "${config_dir}/pure-ftpd.conf"

      $ldap_conf_erb   = 'pure-ftpd.conf.erb'
      $ldap_conf_path  = "${config_dir}/pureftpd-ldap.conf"

      $mysql_conf_erb  = 'pure-ftpd.conf.erb'
      $mysql_conf_path = "${config_dir}/pureftpd-mysql.conf"

      $pgsql_conf_erb  = 'pure-ftpd.conf.erb'
      $pgsql_conf_path = "${config_dir}/pureftpd-pgsql.conf"
    }
    default:{
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
