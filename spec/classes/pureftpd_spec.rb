require 'spec_helper'

describe 'pureftpd', :type => :class do
  let(:facts) { {:osfamily=> 'RedHat'} }

  describe 'with no params' do
    it { should contain_class('pureftpd') }
    it { should contain_class('pureftpd::install') }
    it do
      should contain_class('pureftpd::config').
        with_notify('Class[Pureftpd::Service]')
    end
    it { should_not contain_class('pureftpd::config::ldap') }
    it { should_not contain_class('pureftpd::config::mysql') }
    it { should_not contain_class('pureftpd::config::postgres') }
    it { should contain_class('pureftpd::service') }
  end

  describe 'with $use_selinux => true' do
    let(:params) {{ :use_selinux => true }}

    it { should contain_class('pureftpd') }
    it { should contain_class('pureftpd::install').with_use_selinux(true) }
    it do
      should contain_class('pureftpd::config').
        with_notify('Class[Pureftpd::Service]')
    end
    it { should_not contain_class('pureftpd::config::ldap') }
    it { should_not contain_class('pureftpd::config::mysql') }
    it { should_not contain_class('pureftpd::config::postgres') }
    it { should contain_class('pureftpd::service') }
  end

  describe 'with $use_selinux => false' do
    let(:params) {{ :use_selinux => false }}

    it { should contain_class('pureftpd') }
    it { should contain_class('pureftpd::install').with_use_selinux(false) }
    it do
      should contain_class('pureftpd::config').
        with_notify('Class[Pureftpd::Service]')
    end
    it { should_not contain_class('pureftpd::config::ldap') }
    it { should_not contain_class('pureftpd::config::mysql') }
    it { should_not contain_class('pureftpd::config::postgres') }
    it { should contain_class('pureftpd::service') }
  end

  describe 'with $use_selinux => not-a-bool' do
    let(:params) {{ :use_selinux => 'not-a-bool' }}

    it 'should fail' do
      expect {
        should contain_class('pureftpd') 
      }.to raise_error(Puppet::Error, /is not a boolean/)
    end
  end

  describe 'with $config => {}' do
    let(:params) {{ :config => {} }}

    it { should contain_class('pureftpd') }
    it { should contain_class('pureftpd::install') }
    it do
      should contain_class('pureftpd::config').
        with_notify('Class[Pureftpd::Service]')
    end
    it { should_not contain_class('pureftpd::config::ldap') }
    it { should_not contain_class('pureftpd::config::mysql') }
    it { should_not contain_class('pureftpd::config::postgres') }
    it { should contain_class('pureftpd::service') }
  end

  describe 'with $config keys' do
    let(:params) {{
      :config => {
        'daemonize' => 'Yes',
        'ipv4only'  => 'No',
      }
    }}

    it { should contain_class('pureftpd') }
    it { should contain_class('pureftpd::install') }
    it do
      should contain_class('pureftpd::config').
        with_notify('Class[Pureftpd::Service]').
        with({
        'daemonize' => 'Yes',
        'ipv4only'  => 'No',
      })
    end
    it { should_not contain_class('pureftpd::config::ldap') }
    it { should_not contain_class('pureftpd::config::mysql') }
    it { should_not contain_class('pureftpd::config::postgres') }
    it { should contain_class('pureftpd::service') }
  end

  describe 'with $config => not-a-hash' do
    let(:params) {{ :config => 'not-a-hash' }}

    it 'should fail' do
      expect {
        should contain_class('pureftpd') 
      }.to raise_error(Puppet::Error, /is not a Hash/)
    end
  end

  describe 'with $config_ldap => { ... }' do
    let(:params) do
      {
        :config_ldap => {
          'ldapserver' => 'ldap.example.com',
          'ldapport'   => '389',
        }
      }
    end

    it { should contain_class('pureftpd') }
    it { should contain_class('pureftpd::install') }
    it do
      should contain_class('pureftpd::config').
        with_notify('Class[Pureftpd::Service]')
    end
    it do
      should contain_class('pureftpd::config::ldap').
        with_notify('Class[Pureftpd::Service]').
        with({
          'ldapserver' => 'ldap.example.com',
          'ldapport'   => '389',
        })
    end
    it { should_not contain_class('pureftpd::config::mysql') }
    it { should_not contain_class('pureftpd::config::postgres') }
    it { should contain_class('pureftpd::service') }
  end

  describe 'with $config_ldap => not-a-hash' do
    let(:params) {{ :config_ldap => 'not-a-hash' }}

    it 'should fail' do
      expect {
        should contain_class('pureftpd') 
      }.to raise_error(Puppet::Error, /is not a Hash/)
    end
  end

  describe 'with $config_mysql => { ... }' do
    let(:params) do
      {
        :config_mysql => {
          'mysqlserver' => 'localhost',
          'mysqlport'   => '3306',
        }
      }
    end

    it { should contain_class('pureftpd') }
    it { should contain_class('pureftpd::install') }
    it do
      should contain_class('pureftpd::config').
        with_notify('Class[Pureftpd::Service]')
    end
    it { should_not contain_class('pureftpd::config::ldap') }
    it do
      should contain_class('pureftpd::config::mysql').
        with_notify('Class[Pureftpd::Service]').
        with({
          'mysqlserver' => 'localhost',
          'mysqlport'   => '3306',
        })
    end
    it { should_not contain_class('pureftpd::config::postgres') }
    it { should contain_class('pureftpd::service') }
  end

  describe 'with $config_mysql => not-a-hash' do
    let(:params) {{ :config_mysql => 'not-a-hash' }}

    it 'should fail' do
      expect {
        should contain_class('pureftpd') 
      }.to raise_error(Puppet::Error, /is not a Hash/)
    end
  end

  describe 'with $config_pgsql => { ... }' do
    let(:params) do
      {
        :config_pgsql => {
          'pgsqlserver' => 'localhost',
          'pgsqlport'   => '5432',
        }
      }
    end

    it { should contain_class('pureftpd') }
    it { should contain_class('pureftpd::install') }
    it do
      should contain_class('pureftpd::config').
        with_notify('Class[Pureftpd::Service]')
    end
    it { should_not contain_class('pureftpd::config::ldap') }
    it { should_not contain_class('pureftpd::config::mysql') }
    it do
      should contain_class('pureftpd::config::pgsql').
        with_notify('Class[Pureftpd::Service]').
        with({
          'pgsqlserver' => 'localhost',
          'pgsqlport'   => '5432',
        })
    end
    it { should contain_class('pureftpd::service') }
  end

  describe 'with $config_pgsql => not-a-hash' do
    let(:params) {{ :config_pgsql => 'not-a-hash' }}

    it 'should fail' do
      expect {
        should contain_class('pureftpd') 
      }.to raise_error(Puppet::Error, /is not a Hash/)
    end
  end

  describe 'with all config sections' do
    let(:params) do
      {
        :use_selinux => true,
        :config      => {
          'ipv4only' => 'No',
        },
        :config_ldap           => {
          'ldapserver' => 'ldap.example.com',
        },
        :config_mysql => {
          'mysqlserver' => 'localhost',
        },
        :config_pgsql => {
          'pgsqlserver' => 'localhost',
        }
      }
    end

    it { should contain_class('pureftpd') }
    it { should contain_class('pureftpd::install') }
    it do
      should contain_class('pureftpd::config').
        with_notify('Class[Pureftpd::Service]').
        with({
          'ipv4only'  => 'No',
      })
    end
    it do
      should contain_class('pureftpd::config::ldap').
        with_notify('Class[Pureftpd::Service]').
        with({
          'ldapserver' => 'ldap.example.com',
        })
    end
    it do
      should contain_class('pureftpd::config::mysql').
        with_notify('Class[Pureftpd::Service]').
        with({
          'mysqlserver' => 'localhost',
        })
    end
    it do
      should contain_class('pureftpd::config::pgsql').
        with_notify('Class[Pureftpd::Service]').
        with({
          'pgsqlserver' => 'localhost',
        })
    end
    it { should contain_class('pureftpd::service') }
  end

end
