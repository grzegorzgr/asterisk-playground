require 'spec_helper.rb'

describe 'profile::yum_secur' do
  let(:facts) {{ :operatingsystem => 'Linux' }}
  it do
    should contain_cron('cron_yum_secur')
  end
end
