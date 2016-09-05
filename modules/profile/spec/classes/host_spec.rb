require 'spec_helper.rb'

describe 'profile::host' do
  let(:facts) {{
    :operatingsystem => 'Linux',
    :osfamily        => 'redhat',
    :puppetversion   => '4.5.2',
    :sudoversion     => '1.8.6p7'
  }}
  it do
    is_expected.to contain_host('ensure ipv4')
    is_expected.to contain_host('remove ipv6')

  end
end
