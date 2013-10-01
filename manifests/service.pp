class mcollective::service () {
  service { $mcollective::params::mcollective_service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
  }
}

