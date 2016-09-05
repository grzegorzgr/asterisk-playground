require 'spec_helper.rb'

describe 'profile::nginx'  do
  let(:facts) {{ :operatingsystem => 'Linux' }}
  it do
    is_expected.to compile
    is_expected.to contain_class('profile::nginx')
    is_expected.to contain_class('nginx')
    is_expected.to contain_package('uuid')
      .with_ensure('installed')
    is_expected.to contain_package('uuid-perl')
      .with_ensure('installed')
    is_expected.to contain_package('nginx-module-perl')
      .with_ensure('installed')
      .with_require('[Class[Nginx::Package]{:name=>"Nginx::Package"}]')
      .with_before('[File[/etc/nginx/conf.d/02-request-uuid.conf]{:path=>"/etc/nginx/conf.d/02-request-uuid.conf"}]')
    is_expected.to contain_file('/etc/nginx/conf.d/02-request-uuid.conf')
      .with_ensure('present')
      .with_owner('root')
      .with_group('root')
      .with_mode('0644')
      .with_source('puppet:///modules/profile/nginx/request-uuid.conf')
      .with_require('[Package[nginx-module-perl]{:name=>"nginx-module-perl"}, Package[uuid]{:name=>"uuid"}, Package[uuid-perl]{:name=>"uuid-perl"}]')
      .with_notify('Service[nginx]')
    is_expected.to contain_yumrepo('nginx')
  end
end
