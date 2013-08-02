require 'spec_helper'

describe 'pureftpd' do
  let(:facts) { {:osfamily=> 'RedHat'} }

  describe 'with no params' do
    it do
      should include_class('pureftpd') 
      should include_class('pureftpd::install') 
      should include_class('pureftpd::config') 
      should include_class('pureftpd::service') 
    end
  end
end
