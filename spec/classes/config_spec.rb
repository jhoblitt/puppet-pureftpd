require 'spec_helper'

  config_options = [
    'IPV4Only',
    'IPV6Only',
    'ChrootEveryone',
    'BrokenClientsCompatibility',
    'Daemonize',
    'VerboseLog',
    'DisplayDotFiles',
    'AnonymousOnly',
    'NoAnonymous',
    'DontResolve',
    'AnonymousCanCreateDirs',
    'NATmode',
    'CallUploadScript',
    'AntiWarez',
    'AllowUserFXP',
    'AllowAnonymousFXP',
    'ProhibitDotFilesWrite',
    'ProhibitDotFilesRead',
    'AllowDotFiles',
    'AutoRename',
    'AnonymousCantUpload',
    'LogPID',
    'NoChmod',
    'KeepAllFiles',
    'CreateHomeDir',
    'NoRename',
    'CustomerProof',
    'NoTruncate',
    'FileSystemCharset',
    'ClientCharset',
    'SyslogFacility',
    'FortunesFile',
    'ForcePassiveIP',
    'Bind',
    'AnonymousBandwidth',
    'UserBandwidth',
    'TrustedIP',
    'AltLog',
    'PIDFile',
    'MaxIdleTime',
    'MaxDiskUsage',
    'TrustedGID',
    'MaxClientsNumber',
    'MaxClientsPerIP',
    'MaxLoad',
    'MinUID',
    'TLS',
    'LimitRecursion',
    'PassivePortRange',
    'AnonymousRatio',
    'UserRatio',
    'Umask',
    'Quota',
    'PerUserLimits',
    'LDAPConfigFile',
    'MySQLConfigFile',
    'PGSQLConfigFile',
    'PureDB',
    'ExtAuth',
  ]

describe 'pureftpd::config' do

  shared_examples 'config' do |params, content|
    let(:facts) {{ :osfamily=> 'RedHat' }}
    let(:params) { params }

    it do
      should include_class('pureftpd::config') 
      should contain_file('/etc/pure-ftpd/pure-ftpd.conf') \
        .with_ensure('file') \
        .with_content(content)
    end
  end

  all_params  = {}
  all_content = ''
  value = 'xxx'

  # accumutate all of the params and content strings as we test each individual
  # option so we can use them for the next test
  config_options.each do |option|
    params = {}
    params[option.downcase.to_sym] = value
    content = sprintf("%-19s %s\n", option, value)

    all_params.merge!(params)
    all_content += content

    it_behaves_like 'config', params, content
  end
  
  # test all of the known options at once this works because the ordering of
  # options values in the output file is fixed
  context 'all parameters' do
    it_behaves_like 'config', all_params, all_content
  end

end
