require 'rspec-puppet'

RSpec.configure do |c|
  c.module_path  = 'modules:modules_librarian'
  c.manifest_dir = 'manifests'
  c.default_facts = {
    :operatingsystem => 'Linux',
    :osfamily        => 'Redhat'
  }
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!(80)
  end
  c.color = true
end
