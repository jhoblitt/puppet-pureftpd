require 'spec_helper'

describe 'pureftpd::config::ldap' do
  let(:facts) {{ :osfamily=> 'RedHat' }}

  describe 'with no params' do
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file').with_content('')
    end
  end

  describe 'with ldapserver' do
    let(:params) {{ :ldapserver => 'ldap.example.com' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPServer          ldap.example.com/)
    end
  end

  describe 'with ldapport' do
    let(:params) {{ :ldapport => '389' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPPort            389/)
    end
  end

  describe 'with ldapbinddn' do
    let(:params) {{ :ldapbinddn => 'cn=Manager,dc=c9x,dc=org' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPBindDN          cn=Manager,dc=c9x,dc=org/)
    end
  end

  describe 'with ldapbindpw' do
    let(:params) {{ :ldapbindpw => 'r00tPaSsw0rD' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPBindPW          r00tPaSsw0rD/)
    end
  end

  describe 'with ldapbasedn' do
    let(:params) {{ :ldapbasedn => 'cn=Users,dc=c9x,dc=org' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPBaseDN          cn=Users,dc=c9x,dc=org/)
    end
  end

  describe 'with ldapfilter' do
    let(:params) {{ :ldapfilter => '(&(objectClass=posixAccount)(uid=\L))' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(Regexp.new(Regexp.quote('LDAPFilter          (&(objectClass=posixAccount)(uid=\L))')))
    end
  end

  describe 'with ldaphomedir' do
    let(:params) {{ :ldaphomedir => 'homeDirectory' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPHomeDir         homeDirectory/)
    end
  end

  describe 'with ldapversion' do
    let(:params) {{ :ldapversion => '3' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPVersion         3/)
    end
  end

  describe 'with ldapdefaultuid' do
    let(:params) {{ :ldapdefaultuid => '100' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPDefaultUID      100/)
    end
  end

  describe 'with ldapforcedefaultuid' do
    let(:params) {{ :ldapforcedefaultuid => 'False' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPForceDefaultUID False/)
    end
  end

  describe 'with ldapdefaultgid' do
    let(:params) {{ :ldapdefaultgid => '100' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPDefaultGID      100/)
    end
  end

  describe 'with ldapdefaultgid' do
    let(:params) {{ :ldapdefaultgid => '100' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPDefaultGID      100/)
    end
  end

  describe 'with ldapforcedefaultgid' do
    let(:params) {{ :ldapforcedefaultgid => 'False' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPForceDefaultGID False/)
    end
  end

  describe 'with ldapusetls' do
    let(:params) {{ :ldapusetls => 'False' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPUseTLS          False/)
    end
  end

  describe 'with ldapauthmethod' do
    let(:params) {{ :ldapauthmethod => 'PASSWORD' }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPAuthMethod      PASSWORD/)
    end
  end

  describe 'with everything' do
    let(:params) {{
      :ldapserver          => 'ldap.example.com',
      :ldapauthmethod      => 'PASSWORD',
      :ldapport            => '389',
      :ldapbinddn          => 'cn=Manager,dc=c9x,dc=org',
      :ldapbindpw          => 'r00tPaSsw0rD',
      :ldapbasedn          => 'cn=Users,dc=c9x,dc=org',
      :ldapfilter          => '(&(objectClass=posixAccount)(uid=\L))',
      :ldaphomedir         => 'homeDirectory',
      :ldapversion         => '3',
      :ldapdefaultuid      => '100',
      :ldapforcedefaultuid => 'False',
      :ldapdefaultgid      => '100',
      :ldapdefaultgid      => '100',
      :ldapforcedefaultgid => 'False',
      :ldapusetls          => 'False',
      :ldapauthmethod      => 'PASSWORD',
    }}
    it do
      should contain_class('pureftpd::config::ldap') 
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf') \
        .with_ensure('file') \
        .with_content(/^LDAPServer          ldap.example.com/) \
        .with_content(/^LDAPPort            389/) \
        .with_content(/^LDAPBindDN          cn=Manager,dc=c9x,dc=org/) \
        .with_content(/^LDAPBindPW          r00tPaSsw0rD/) \
        .with_content(/^LDAPBaseDN          cn=Users,dc=c9x,dc=org/) \
        .with_content(Regexp.new(Regexp.quote('LDAPFilter          (&(objectClass=posixAccount)(uid=\L))'))) \
        .with_content(/^LDAPHomeDir         homeDirectory/) \
        .with_content(/^LDAPVersion         3/) \
        .with_content(/^LDAPDefaultUID      100/) \
        .with_content(/^LDAPForceDefaultUID False/) \
        .with_content(/^LDAPDefaultGID      100/) \
        .with_content(/^LDAPDefaultGID      100/) \
        .with_content(/^LDAPForceDefaultGID False/) \
        .with_content(/^LDAPUseTLS          False/) \
        .with_content(/^LDAPAuthMethod      PASSWORD/) \
    end
  end
end
