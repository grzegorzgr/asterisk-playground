class profile::yum_secur {
  cron { 'cron_yum_secur':
    ensure  => 'present',
    command => 'yum update --security',
    hour    => '23',
    weekday => '6',
  }
}
