class profile::jenkins::master (
  $deploy_priv_key = '',
  $mounts = {},
  ){

  require profile::jenkins::common
  include jenkins

  if ($::selinux) {
    selboolean {'httpd_can_network_connect':
      persistent => true,
      value      => 'on',
    }
  }

  file {'/var/lib/jenkins/.ssh':
    ensure => directory,
    owner  => 'jenkins',
    group  => 'jenkins',
    mode   => '0700',
  }

  file {'/var/lib/jenkins/.ssh/id_rsa_deploy_4096.priv':
    ensure  => present,
    owner   => 'jenkins',
    group   => 'jenkins',
    mode    => '0600',
    content => $deploy_priv_key,
    require => File['/var/lib/jenkins/.ssh'],
  }

  file {'/var/lib/jenkins/.ssh/config':
    ensure  => present,
    owner   => 'jenkins',
    group   => 'jenkins',
    mode    => '0644',
    source  => "puppet:///modules/${module_name}/ssh_config",
    require => File['/var/lib/jenkins/.ssh'],
  }

  validate_hash($mounts)
  create_resources(mount, $mounts, {})
}
