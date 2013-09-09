# == Class: pureftpd::service
#
# This class should be considered private.
#
#
class pureftpd::service inherits pureftpd::params {
  service { $pureftpd::params::service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
