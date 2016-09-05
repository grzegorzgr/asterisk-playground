require 'spec_helper.rb'

describe 'profile::baseline' do
  let(:facts) {{
    :operatingsystem => 'Linux',
    :osfamily        => 'redhat',
    :puppetversion   => '4.5.2',
    :sudoversion     => '1.8.6p7'
  }}
  it do
    is_expected.to contain_class('profile::baseline')
    is_expected.to contain_class('profile::packages')
    is_expected.to contain_class('profile::yum_secur')
    is_expected.to contain_class('profile::host')
    is_expected.to contain_stage('bootstrap')
    is_expected.to contain_package('openssl').
    with_ensure('latest')
    is_expected.to contain_cron('reboot').
    with_name('puppet apply after vm reboot').
    with_user('root').
    with_special('reboot')
  end
end
