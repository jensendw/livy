# == Class: livy::params
#
#  All parameters for the livy puppet module
#
class livy::params {
  $install_method                 = 'url'
  $package_name                   = 'livy-server'
  $download_url_base              = 'http://archive.cloudera.com/beta/livy/'
  $download_extension             = 'zip'
  $version                        = '0.2.0'
  $config_mode                    = '0660'
  $livy_dir                       = "/opt/${package_name}-${version}"
  $livy_bin_dir                   = "${livy_dir}/bin"
  $livy_conf_dir                  = "${livy_dir}/conf"
  $livy_user                      = 'hdfs'
  $service_name                   = $package_name
  $spark_home                     = '/usr/lib/spark'
  $hadoop_conf_dir                = '/etc/hadoop/conf'
  $conf_keystore                  = undef
  $conf_keystore_password         = undef
  $conf_server_host               = undef
  $conf_server_port               = undef
  $conf_server_sesison_timeout    = undef
  $conf_impersonation_enabled     = undef
  $conf_jars                      = undef
  $conf_repl_jars                 = undef
  $conf_pyspark_archives          = undef
  $conf_sparkr_package            = undef
  $conf_file_local_dir_whitelist  = undef

  #set init style
  if $::operatingsystem =~ /Scientific|CentOS|RedHat|OracleLinux/ {
    case $::operatingsystemmajrelease {
      '6': {
        $init_style = 'sysv'
        $init_path  = "/etc/init.d/${service_name}"
      }
      '7': {
        $init_style = 'systemd'
        $init_path  = "/lib/systemd/system/${service_name}.service"
      }
      default: {
        $init_style = 'sysv'
        $init_path  = "/etc/init.d/${service_name}"
      }
    }
  } else {
    fail('Unsupported operating system')
  }


}
