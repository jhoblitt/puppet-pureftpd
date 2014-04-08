require 'spec_helper'

describe 'pureftpd::install', :type => :class do
  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    describe 'no params' do
      it { should contain_class('pureftpd::install') }
      it { should contain_package('pure-ftpd').with_ensure('present') }
      it { should_not contain_package('pure-ftpd-selinux').with_ensure('present') }
    end

    describe 'use_selinux = false' do
      let(:params) {{ :use_selinux => false }}

      it { should contain_class('pureftpd::install') }
      it { should contain_package('pure-ftpd').with_ensure('present') }
      it { should_not contain_package('pure-ftpd-selinux').with_ensure('present') }
    end

    describe 'use_selinux = true' do
      let(:params) {{ :use_selinux => true }}

      it { should contain_class('pureftpd::install') }
      it { should contain_package('pure-ftpd').with_ensure('present') }
      it { should contain_package('pure-ftpd-selinux').with_ensure('present') }
    end

    describe 'use_selinux = foo' do
      let(:params) {{ :use_selinux => 'foo' }}

      it 'should fail' do
        expect { should contain_class('pureftpd::install') }.
          to raise_error(Puppet::Error, /not a boolean/)
      end
    end
  end

end
