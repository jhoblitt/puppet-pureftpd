# == Class: pureftpd::service
#
# This class manages the pure-ftpd service, and ensure that it is running
#
# === Parameters
#
# === Actions
#
# - Ensure that the pure-ftpd service is up and running
#
# === Authors
#
# 5Ub-Z3r0
#
class pureftpd::service {
    service { $pureftpd::params::service_name:
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => false,
        #require    => Class['pureftpd::config'],
    }
}
