# == Define: pureftpd::config
#
# This module manages the pure-ftpd server configuration file
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
# pureftpd::config { 'ftp-server':
#   user_bandwidth => '1800:1800'
# }
#
# === Authors
#
# 5Ub-Z3r0
#
class pureftpd::config(
  $chrooteveryone      = true,
  $trustedgid          = '100',
  $brokenclientscompatibility = false,
  $maxclientsnumber    = '50',
  $maxclientsperip     = '8',
  $verboselog          = false,
  $displaydotfiles     = true,
  $anonymousonly       = false,
  $noanonymous         = false,
  $syslogfacility      = 'ftp',
  $fortunesfile        = false,
  $dontresolve         = true,
  $maxidletime         = '15',
  $ldapconfigfile      = false,
  $mysqlconfigfile     = false,
  $pgsqlconfigfile     = false,
  $pamauthentication   = true,
  $unixauthentication  = false,
  $limitrecursion      = '10000 8',
  $anonymouscancreatedirs = false,
  $maxload             = '4',
  $passiveportrange    = undef,
  $forcepassiveip      = undef,
  $anonymousratio      = undef,
  $userratio           = undef,
  $antiwarez           = true,
  $bind	               = false, # false means bind to ALL
  $anonymousbandwidth  = false,
  $userbandwidth       = undef,
  $umask               = '133:022',
  $minuid              = '500',
  $useftpusers         = false,
  $allowuserfxp        = false,
  $allowanonymousfxp   = false,
  $prohibitdotfileswrite = false,
  $prohibitdotfilesread = false,
  $autorename          = false,
  $anonymouscantupload = true,
  $trustedip           = false,
  $logpid              = false,
  $altlog              = 'clf:/var/log/pureftpd.log',
  $nochmod             = false,
  $createhomedir       = false,
  $quota               = false,
  $maxdiskusage        = '99',
  $norename            = false,
  $customerproof       = true,
  $peruserlimits       = false,
  $notruncate          = false,
  $tls                 = false,
  $ipv4only            = false,
  $ipv6only            = false,
) inherits pureftpd::params {

  file { "${pureftpd::params::config_dir}/pure-ftpd.conf":
    ensure  => file,
    content => template("${module_name}/${::osfamily}/pure-ftpd.conf.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$pureftpd::params::service_name]
  }
}
