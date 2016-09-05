require 'spec_helper.rb'

describe 'profile::baseline' do
  let(:facts) {{
    :sudoversion     => '1.8.6p7',
    :puppetversion   => '4.5.2',
    :node_role       => 'nginx'
  }}
  it do
    is_expected.to contain_cron('reboot').
      with_ensure('absent')
  end
end

describe 'profile::baseline' do
  let(:facts) {{
    :operatingsystem => 'Linux',
    :osfamily        => 'redhat',
    :puppetversion   => '4.5.2',
    :sudoversion     => '1.8.6p7'
  }}
  it do
    is_expected.to contain_cron('reboot').
      with_ensure('present')
    is_expected.to contain_stage('bootstrap').
      that_comes_before('Stage[main]')
    is_expected.to contain_class('woa4pl_repo').
      with_stage('bootstrap')
    is_expected.to contain_package('openssl').
      with_ensure('latest')
    is_expected.to contain_class('profile::packages')
    is_expected.to contain_class('profile::yum_secur')
    is_expected.to contain_class('profile::host')
    is_expected.to contain_class('woa4pl_chrony')
    is_expected.to contain_class('woa4pl_users')
    is_expected.to contain_class('woa4pl_timezone')
    is_expected.to contain_class('woa4pl_sysctl')
    is_expected.to contain_class('woa4pl_sshd')
    is_expected.to contain_class('woa4pl_fail2ban')
    is_expected.to contain_class('woa4pl_clamav')
    is_expected.to contain_class('woa4pl_rsyslog')
    is_expected.to contain_class('woa4pl_ossec')
    is_expected.to contain_class('woa4pl_firewall')
    is_expected.to contain_class('woa4pl_smtp')
    is_expected.to contain_class('woa4pl_exporters')
    is_expected.to contain_class('woa4pl_hardening')
    is_expected.to contain_class('woa4pl_collectd')
    is_expected.to contain_class('woa4pl_logrotate')
  end
end
