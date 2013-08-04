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
# [*config*]
#   Optional, defaults to `{}`.
#
# === Authors
#
# 5Ub-Z3r0
#
class pureftpd (
  $use_selinux = false,
  $config      = {},
) {
  validate_bool($use_selinux)
  validate_hash($config)

  include pureftpd::service

  class{ 'pureftpd::install': use_selinux => $use_selinux }

  create_resources( 'class', { 'pureftpd::config' => $config } ) 

  Class[ 'pureftpd::install' ] ->
  Class[ 'pureftpd::config' ] ->
  Class[ 'pureftpd::service' ] ->
  Class[ 'pureftpd' ]
}
