# == Define: pureftpd::config_pgsql
#
# This module manages the pure-ftpd configuration files with pgsql authentication
#
# === Parameters
#
# [*use_selinux*]
#  Optional, defaults to false.
#  Manages whether or not to enable selinux extensions.
#
# [*allow_anonymous*]
#  Optional, defaults to false.
#  Manages whether or not to allow anonymous users.
#
# [*allow_fxp*]
#  Optional, defaults to false.
#  Manages whether or not to allow the fxp protocol
#
# [*user_bandwidth*]
#  Optional, defaults to undef.
#  Defines the maximum bandwidth that the can be used, in the form
#  $kb_download:$kb_upload (e.g., 1800:1800).
#
# [*max_clients_number*]
#  Optional, defaults to 50.
#  Maximum number of simultaneous users that the server can manage.
#
# [*max_clients_per_ip*]
#  Optional, defaults to 8.
#  Maximum number of different clients that can come from a single IP
#
# [*umask*]
#  Optional, defaults to 133:022.
#  Specifies the user mask of the uploaded files/directories, in the form
#  $file_umask:$dir_umask (e.g., 177:077).
#
# [*min_uid*]
#  Optional, defaults to 500.
#  The minimum user id that can be accepted as an ftp user.
#
# [*allow_chmod*]
#  Optional, defaults to false.
#  Whether or not users are allowed to change ownerships of their files.
#
# [*use_tls*]
#  Optional, defaults to false.
#  Whether or not to accept tls connections in addition to normal ones.
#  TODO: Remember to place your server certificate in  /etc/ssl/private/pure-ftpd.pem
#
# [*force_passive_ip*]
#  Optional, defaults to undef (not set)
#  Force an IP address in PASV/EPSV/SPSV replies
#
# [*motd_file*]
#  Optional, defaults to undef (use the dynamic provided file).
#  Manages the location of the server motd file, if any.
#
# === Examples
#
# pureftpd::config_pgsql { 'ftp-server':
#   user_bandwidth => '1800:1800'
# }
#
# === Authors
#
# 5Ub-Z3r0
#
# === TODO:
# - implement template and variables for the pgsql config file
#
class pureftpd::config_pgsql (
  $use_selinux         = false,
  $allow_anonymous     = false,
  $allow_fxp           = false,
  $user_bandwidth      = undef,
  $max_clients_number  = '50',
  $max_clients_per_ip  = '8',
  $umask               = '133:022',
  $min_uid             = '500',
  $allow_chmod         = false,
  $use_tls             = false,
  $force_passive_ip    = undef,
  $motd_file           = undef
) {

  file { "${pureftpd::params::config_dir}/pureftpd-pgsql.conf":
    ensure  => file,
    content => template("${module_name}/${::osfamily}/pureftpd-pgsql.conf.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$pureftpd::params::service_name]
  }
}
