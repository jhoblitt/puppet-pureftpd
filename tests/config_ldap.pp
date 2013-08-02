pureftpd::config_ldap { 'ldap':
  max_clients_number => '100',
  max_clients_per_ip => '100',
  umask              => '117:007',
  min_uid            => '1000',
  user_bandwidth     => '1800:1800',
  ldap_server        => '192.168.100.10',
  ldap_basedn        => 'ou=Users,dc=neptuny,dc=it',
  ldap_filter        => '(&(objectClass=posixAccount)(uid=\L))',
  ldap_authmethod    => 'BIND'
  }
