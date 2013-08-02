require 'spec_helper'

describe 'pureftpd' do
  let(:facts) { {:osfamily=> 'RedHat'} }

  describe 'with no params' do
    it do
      should include_class('pureftpd') 
      should include_class('pureftpd::install') 
      should include_class('pureftpd::config') 
      should include_class('pureftpd::service') 
      should contain_package('pure-ftpd').with_ensure('present')
      should_not contain_package('pure-ftpd-selinux')
      should contain_file('/etc/pure-ftpd/pure-ftpd.conf').with_ensure('file')
      should contain_service('pure-ftpd').with({
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end

  describe 'with $use_selinux' do
    let(:params) {{ :use_selinux => true }}
    it do
      should include_class('pureftpd') 
      should include_class('pureftpd::install') 
      should include_class('pureftpd::config') 
      should include_class('pureftpd::service') 
      should contain_package('pure-ftpd').with_ensure('present')
      should contain_package('pure-ftpd-selinux').with_ensure('present')
      should contain_file('/etc/pure-ftpd/pure-ftpd.conf').with_ensure('file')
      should contain_service('pure-ftpd').with({
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end
end
