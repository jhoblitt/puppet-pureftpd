require 'spec_helper'

conf_options = [
  'PGSQLServer',
  'PGSQLPort',
  'PGSQLUser',
  'PGSQLPassword',
  'PGSQLDatabase',
  'PGSQLCrypt',
  'PGSQLGetPW',
  'PGSQLGetUID',
  'PGSQLDefaultUID',
  'PGSQLGetGID',
  'PGSQLDefaultGID',
  'PGSQLGetDir',
  'PGSQLGetQTAFS',
  'PGSQLGetQTASZ',
  'PGSQLGetRatioUL',
  'PGSQLGetRatioDL',
  'PGSQLGetBandwidthUL',
  'PGSQLGetBandwidthDL',
]

describe 'pureftpd::config::pgsql' do

  shared_examples 'config' do |params, content|
    let(:facts) {{ :osfamily=> 'RedHat' }}
    let(:params) { params }

    it do
      should contain_class('pureftpd::config::pgsql') 
      should contain_file('/etc/pure-ftpd/pureftpd-pgsql.conf') \
        .with_ensure('file') \
        .with_content(content)
    end
  end

  all_params  = {}
  all_content = ''
  value = 'xxx'

  # accumutate all of the params and content strings as we test each individual
  # option so we can use them for the next test
  context 'one option at a time' do
    conf_options.each do |option|
      params = {}
      params[option.downcase.to_sym] = value
      content = sprintf("%-19s %s\n", option, value)

      all_params.merge!(params)
      all_content += content

      it_behaves_like 'config', params, content
    end
  end
  
  # test all of the known options at once this works because the ordering of
  # options values in the output file is fixed
  context 'all options' do
    it_behaves_like 'config', all_params, all_content
  end

  context 'no options' do
    it_behaves_like 'config', {}, ''
  end

  context 'invalid param' do
    let(:facts) {{ :osfamily=> 'RedHat' }}
    let(:params) {{ :foo => 'bar' }}

    it 'should fail' do
      expect { should contain_class('pureftpd::config::pgsql') }.
        to raise_error(Puppet::Error, /Invalid parameter foo/)
    end
  end

end
