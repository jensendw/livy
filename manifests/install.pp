# == Class: livy::install
#
#  Fetches and installs the livy-server binary
#
class livy::install {
  case $consul::install_method {
    'url': {
      include ::staging
      staging::deploy { "${livy::package_name}-${livy::version}.${livy::download_extension}":
        source  => "${livy::download_url_base}/${livy::package_name}-${livy::version}.${livy::download_extension}",
        target  => '/opt/',
        creates => "/opt/${livy::package_name}-${livy::version}/bin/livy-server",
      }

      file { "/opt/${livy::package_name}":
        ensure => link,
        target => "/opt/${livy::package_name}-${livy::version}",
      }

    }
    default: {
      fail('Unknown install method specified')
    }
  }
}
