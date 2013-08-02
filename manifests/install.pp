# == Class: pureftpd::install
#
# This class installs the pure-ftpd server
#
# === Parameters
#
# [*use_selinux*]
#   Optional, defaults to false.
#   Manages whether or not to enable the selinux extensions.
#
# === Authors
#
# 5Ub-Z3r0
# Joshua Hoblitt <jhoblitt@cpan.org>
#

class pureftpd::install (
  $use_selinux = false,
) inherits pureftpd::params {

  if ($use_selinux) {
    $package_name = $pureftpd::params::package_name_selinux
  } else {
    $package_name = $pureftpd::params::package_name
  }

  package { $package_name:
    ensure  => present,
  }
}
