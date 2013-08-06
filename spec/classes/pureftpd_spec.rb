require 'spec_helper'

describe 'pureftpd', :type => :class do
  let(:facts) { {:osfamily=> 'RedHat'} }

  describe 'with no params' do
    it do
      should include_class('pureftpd') 
      should include_class('pureftpd::install') 
      should include_class('pureftpd::config') 
      should include_class('pureftpd::service') 
      should contain_package('pure-ftpd').with_ensure('present')
      should_not contain_package('pure-ftpd-selinux')
      should contain_file('/etc/pure-ftpd/pure-ftpd.conf').with_ensure('file')\
        .with_content('')
      should contain_service('pure-ftpd').with({
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end

  describe 'with $use_selinux => true' do
    let(:params) {{ :use_selinux => true }}
    it do
      should include_class('pureftpd') 
      should include_class('pureftpd::install') 
      should include_class('pureftpd::config') 
      should include_class('pureftpd::service') 
      should contain_package('pure-ftpd').with_ensure('present')
      should contain_package('pure-ftpd-selinux').with_ensure('present')
      should contain_file('/etc/pure-ftpd/pure-ftpd.conf').with_ensure('file')\
        .with_content('')
      should contain_service('pure-ftpd').with({
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end

  describe 'with $use_selinux => false' do
    let(:params) {{ :use_selinux => false }}
    it do
      should include_class('pureftpd') 
      should include_class('pureftpd::install') 
      should include_class('pureftpd::config') 
      should include_class('pureftpd::service') 
      should contain_package('pure-ftpd').with_ensure('present')
      should_not contain_package('pure-ftpd-selinux')
      should contain_file('/etc/pure-ftpd/pure-ftpd.conf').with_ensure('file')\
        .with_content('')
      should contain_service('pure-ftpd').with({
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end

  describe 'with $use_selinux => not-a-bool' do
    let(:params) {{ :use_selinux => 'not-a-bool' }}
    it 'should fail' do
      expect {
        should include_class('pureftpd') 
      }.to raise_error(Puppet::Error, /is not a boolean/)
    end
  end

  describe 'with $config => {}' do
    let(:params) {{ :config => {} }}
    it do
      should include_class('pureftpd') 
      should include_class('pureftpd::install') 
      should include_class('pureftpd::config') 
      should include_class('pureftpd::service') 
      should contain_package('pure-ftpd').with_ensure('present')
      should_not contain_package('pure-ftpd-selinux')
      should contain_file('/etc/pure-ftpd/pure-ftpd.conf').with_ensure('file')\
        .with_content('')
      should contain_service('pure-ftpd').with({
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end

  describe 'with $config keys' do
    let(:params) {{
      :config => {
        'daemonize' => 'Yes',
        'ipv4only'  => 'No',
      }
    }}
    it do
      should include_class('pureftpd') 
      should include_class('pureftpd::install') 
      should include_class('pureftpd::config') 
      should include_class('pureftpd::service') 
      should contain_package('pure-ftpd').with_ensure('present')
      should_not contain_package('pure-ftpd-selinux')
      should contain_file('/etc/pure-ftpd/pure-ftpd.conf').with_ensure('file')\
        .with_content(<<-END.gsub(/^\s+/, ""))
        IPV4Only            No
        Daemonize           Yes
        END
      should contain_service('pure-ftpd').with({
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end

  describe 'with $config => not-a-hash' do
    let(:params) {{ :config => 'not-a-bool' }}
    it 'should fail' do
      expect {
        should include_class('pureftpd') 
      }.to raise_error(Puppet::Error, /is not a Hash/)
    end
  end

  describe 'with $config_ldap => { ... }' do
    let(:params) {{
      :config_ldap => {
        'ldapserver' => 'ldap.example.com',
        'ldapport'   => '389',
      }
    }}
    it do
      should include_class('pureftpd') 
      should include_class('pureftpd::install') 
      should include_class('pureftpd::config') 
      should include_class('pureftpd::config::ldap') 
      should include_class('pureftpd::service') 
      should contain_package('pure-ftpd').with_ensure('present')
      should_not contain_package('pure-ftpd-selinux')
      should contain_file('/etc/pure-ftpd/pure-ftpd.conf').with_ensure('file') \
        .with_content(<<-END.gsub(/^\s+/, ""))
        LDAPConfigFile      /etc/pure-ftpd/pureftpd-ldap.conf
        END
      should contain_file('/etc/pure-ftpd/pureftpd-ldap.conf').with_ensure('file') \
        .with_content(<<-END.gsub(/^\s+/, ""))
        LDAPServer          ldap.example.com
        LDAPPort            389
        END
      should contain_service('pure-ftpd').with({
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end

  describe 'with $config_pgsql => { ... }' do
    let(:params) {{
      :config_pgsql => {
        'pgsqlserver' => 'localhost',
        'pgsqlport'   => '5432',
      }
    }}
    it do
      should include_class('pureftpd') 
      should include_class('pureftpd::install') 
      should include_class('pureftpd::config') 
      should include_class('pureftpd::config::pgsql') 
      should include_class('pureftpd::service') 
      should contain_package('pure-ftpd').with_ensure('present')
      should_not contain_package('pure-ftpd-selinux')
      should contain_file('/etc/pure-ftpd/pure-ftpd.conf').with_ensure('file') \
        .with_content(<<-END.gsub(/^\s+/, ""))
        PGSQLConfigFile     /etc/pure-ftpd/pureftpd-pgsql.conf
        END
      should contain_file('/etc/pure-ftpd/pureftpd-pgsql.conf').with_ensure('file') \
        .with_content(<<-END.gsub(/^\s+/, ""))
        PGSQLServer         localhost
        PGSQLPort           5432
        END
      should contain_service('pure-ftpd').with({
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end

end
