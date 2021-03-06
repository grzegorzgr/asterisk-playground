class profile::jenkins::common (){

  $dependencies = [ 'git',
                    'rubygems',
                    'gcc',
                    'ruby-devel',
                    'rpm-build',
                    'fedora-packager',
                    'rpmdevtools',
                    'gcc-c++',
                    'openssl-devel',
                    'git-crypt',
                    'php-devel',
                    'php-mysqlnd',
                    'php-json',
                    'php-pear',
                    ]

  $dependencies.each |$dependency| {
    package {$dependency:
      ensure => latest,
    }
  }

  package {'bundler':
    ensure   => installed,
    provider => 'gem',
    require  => Package['rubygems'],
  }

  package {'ansible':
    ensure  => installed,
    require => Class['epel']
  }

  include epel

  package {'ImageMagick-devel':
    ensure => installed,
  }

  package { 'python-boto':
    ensure => installed,
  }
}
