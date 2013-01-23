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
class pureftpd::params {
  case $::osfamily {
    'RedHat':{
      $package_name = $pureftpd::use_selinux ?{
        true    => 'pure-ftpd-selinux',
        default => 'pure-ftpd'
      }
      $config_dir = '/etc/pure-ftpd'
      $service_name = 'pure-ftpd'
    }
    default:{
      fail ("The module is not available for ${::os_family}")
    }
  }
}
