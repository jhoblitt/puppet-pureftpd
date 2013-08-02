# == Class: pureftpd
#
# This class installs, configures, and enables the pure-ftpd server
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
#
class pureftpd (
  $use_selinux=false
) {
  include pureftpd::config, pureftpd::service

  class{ 'pureftpd::install': use_selinux => $use_selinux }

  Class[ 'pureftpd::install' ] ->
  Class[ 'pureftpd::config' ] ->
  Class[ 'pureftpd::service' ] ->
  Class[ 'pureftpd' ]
}
