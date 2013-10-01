class mcollective (
  $activemq_mcollective_password,
  $ssldir          = '/var/lib/puppet/ssl',
  $activemq_server = 'admin.alkivi.fr',

) {
  # declare all parameterized classes
  class { 'mcollective::params': }
  class { 'mcollective::install': }
  class { 'mcollective::config': }
  class { 'mcollective::service': }

  # declare relationships
  Class['mcollective::params'] ->
  Class['mcollective::install'] ->
  Class['mcollective::config'] ->
  Class['mcollective::service']
}

