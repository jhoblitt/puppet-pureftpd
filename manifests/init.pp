# == Class: pureftpd
#
# This class installs the pure-ftpd server, and ensures that it is running
#
# === Parameters
#
# [*use_selinux*]
# Optional, defaults to false.
# Manages whether or not to enable the selinux extensions.
#
# == Actions
#
# - Installs pure-ftpd
# - Ensure that the pure-ftpd service is up and running
#
# === Authors
#
# 5Ub-Z3r0
#
class pureftpd (
  $use_selinux=false
) {
  include pureftpd::install, pureftpd::config, pureftpd::service

  Class[ 'pureftpd::install' ] ->
  Class[ 'pureftpd::config' ] ->
  Class[ 'pureftpd::service' ] ->
  Class[ 'pureftpd' ]
}
