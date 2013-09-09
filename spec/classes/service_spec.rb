require 'spec_helper'

describe 'pureftpd::service', :type => :class do
  let(:facts) {{ :osfamily => 'RedHat' }}

  it do
    should contain_service('pure-ftpd').with({
      :hasstatus  => 'true',
      :hasrestart => 'true',
      :enable     => 'true',
    })
  end

end

