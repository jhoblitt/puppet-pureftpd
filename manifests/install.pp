# == Class: pureftpd::install
#
# This class installs the pure-ftpd server
#
# === Parameters
#
# === Actions
#
# - if the os family is RedHat, fetch and install the EPEL release file
# - Install the pure-ftpd server on the system
#
# === Authors
#
# 5Ub-Z3r0
#
class pureftpd::install {
  case $::osfamily{
    'RedHat': {
      # On RHEL, we require EPEL
      package { 'epel-release' :
        ensure   => 'present',
        provider => 'rpm',
        source   => $::lsbmajdistrelease ? {
          '5' => 'http://mirror.uv.es/mirror/fedora-epel/5/i386/epel-release-5-4.noarch.rpm',
          '6' => 'http://ftp.tu-chemnitz.de/pub/linux/fedora-epel/6/i386/epel-release-6-7.noarch.rpm'
        }
      }
      package { $pureftpd::params::package_name:
        ensure  => present,
        require => Package ['epel-release']
      }
    }
    'Debian': {
      package { $pureftpd::params::package_name:
        ensure  => present,
      }
    }
    default: {}
  }

}
