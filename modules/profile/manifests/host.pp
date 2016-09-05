# Until resolution of Puppet bug #PUP-1928
class profile::host {

  host { 'remove ipv6':
    ensure       => absent,
    ip           => '::1',
    name         => 'localhost',
    host_aliases => ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6' ],
    before       => Host['ensure ipv4']
  }

  host { 'ensure ipv4':
    ensure       => present,
    ip           => '127.0.0.1',
    name         => 'localhost4',
    host_aliases => ['localhost.localdomain', 'localhost', 'localhost4.localdomain4' ]
  }
}
