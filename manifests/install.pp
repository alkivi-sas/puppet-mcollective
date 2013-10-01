class mcollective::install () {
  package { $mcollective::params::mcollective_package_name:
    ensure  => installed,
    require => Package['ruby-stomp'],
  }

  package { 'ruby-stomp':
    ensure => installed,
  }
}
