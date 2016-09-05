require 'spec_helper.rb'

describe 'profile::apache' do
  let(:facts) {{
    :operatingsystemrelease => '7.2.1511',
    :osfamily               => 'redhat',
  }}
  it do
  end
end
