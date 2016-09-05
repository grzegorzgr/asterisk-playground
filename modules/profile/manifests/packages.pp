class profile::packages (
  Array $remove = [],
  Array $install = [],
  ){

  package {$remove:
    ensure => purged,
  }
  package {$install:
    ensure => latest,
  }
}
