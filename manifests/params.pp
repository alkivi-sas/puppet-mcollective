class mcollective::params () {
  case $::operatingsystem {
    /(Ubuntu|Debian)/: {
      $mcollective_package_name   = 'mcollective'
      $mcollective_service_name   = 'mcollective'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}

