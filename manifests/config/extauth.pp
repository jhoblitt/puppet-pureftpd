# == Class: pureftpd::config::exauth
#
# Manages the pure-ftpd external authentication.  This class should be considered
# private.
#
#

class pureftpd::config::extauth($extauth_handler) {


  notify {$extauth_handler:}

  if $extauth_handler =~ /^puppet:\/\// {

    $tmp = split($extauth_handler,'/')
    $length = size($tmp)
    $filename = $tmp[$length-1]
    $handler_path = "/etc/pure-ftpd/${filename}"

    file {$handler_path:
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      source => $extauth_handler,
      notify => Service['pure-authd'],
    }
  } else {
    $handler_path = $extauth_handler
  }

  file {'/etc/init.d/pure-authd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('pureftpd/pure-authd.erb')
  }

  service {'pure-authd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => File['/etc/init.d/pure-authd']
  }

}
