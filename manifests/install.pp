# == Class: pureftpd::install
#
# This class should be considered private.
#
#
class pureftpd::install (
  $use_selinux = false,
) inherits pureftpd::params {
  validate_bool($use_selinux)

  if ($use_selinux) {
    $package_name = $pureftpd::params::package_name_selinux
  } else {
    $package_name = $pureftpd::params::package_name
  }

  package { $package_name:
    ensure  => present,
  }
}
