class profile::baseline {
  stage {'bootstrap':
    before => Stage['main'],
  }

  # class {'woa4pl_repo':
  #   stage => 'bootstrap',
  # }

  package {'openssl':
    ensure => 'latest',
  }

  $cron_reboot_enure = $::node_role ? {
    /(nginx|apache)/ => absent,
    default          => present,
  }

  cron {'reboot':
    ensure  => $cron_reboot_enure,
    name    => 'puppet apply after vm reboot',
    command => "/opt/puppetlabs/bin/puppet apply //etc/puppetlabs/code/environments/${::environment}/manifests/site.pp",
    user    => 'root',
    special => 'reboot',
  }
}
