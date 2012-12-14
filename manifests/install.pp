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
  package { $pureftpd::params::package_name:
    ensure  => present,
  }
}
