# == Class: pureftpd::ssl
#
class pureftpd::ssl($ssl_certificates) {

  if $ssl_certificates != '' {
    if $ssl_certificates =~ /^puppet:\/\// {
      file {'/etc/pki/pure-ftpd/pure-ftpd.pem':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0400',
        source => $ssl_certificates,
      }
    } else {
      file {'/etc/pki/pure-ftpd/pure-ftpd.pem':
        ensure => link,
        target => $ssl_certificates,
      }
    }
  }

}
