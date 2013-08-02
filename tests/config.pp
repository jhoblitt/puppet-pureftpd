pureftpd::config_ldap { 'ldap':
  max_clients_number => '100',
  max_clients_per_ip => '100',
  umask              => '117:007',
  min_uid            => '1000',
  user_bandwidth     => '1800:1800'
}
