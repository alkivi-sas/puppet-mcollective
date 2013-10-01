class mcollective::config () {

  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
    notify => Service[$mcollective::params::mcollective_service_name],
  }

  file { '/etc/mcollective/server_public.pem':
    source => 'puppet:///modules/mcollective/server_public.pem',
  }

  file { '/etc/mcollective/server_private.pem':
    source => 'puppet:///modules/mcollective/server_private.pem',
  }

  file { '/etc/mcollective/clients':
    ensure  => directory,
    mode    => '0750',
    recurse => true,
  }

  file { '/etc/mcollective/clients/martin.pem':
    source => 'puppet:///modules/mcollective/martin.pem',
  }

  file {'/etc/mcollective/facts.yaml':
    mode     => '0400',
    loglevel => debug, # reduce noise in Puppet reports
    content  => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime_seconds|timestamp|free)/ }.to_yaml %>'), # exclude rapidly changing facts
  }

  file { '/etc/mcollective/server.cfg':
    content => template('mcollective/server.cfg.erb'),
  }

  # Dirty fix to avoid ruby 1.9 bug
  file { '/usr/sbin/mcollectived':
    ensure => present,
    mode   =>'0755',
    source => 'puppet:///modules/mcollective/mcollectived',
  }


}
