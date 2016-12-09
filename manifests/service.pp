# == Class: livy::service
#
#  Sets up the service for livy-server
#
class livy::service {

  service { $livy::service_name:
    ensure    => running,
    enable    => true,
    hasstatus => false,
    require   => File[$livy::init_path],
  }
}
