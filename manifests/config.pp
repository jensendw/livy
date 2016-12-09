# == Class: livy::config
#
#  Handles necessary configuration for livy-server
#
class livy::config {

  file { '/etc/livy':
    ensure => link,
    target => $livy::livy_conf_dir,
  }

  file { "${livy::livy_conf_dir}/livy.conf":
    ensure  => file,
    content => template('livy/livy.conf.erb'),
    notify  => Service[$livy::service_name],
  }

  file { $livy::init_path:
    content => template("livy/livy.${livy::init_style}.erb"),
    mode    => '0755',
  }
}
