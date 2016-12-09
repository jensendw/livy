# == Class: livy
#
#  Module to install livy-server
#
class livy (
  $install_method                 = $livy::params::install_method,
  $package_name                   = $livy::params::package_name,
  $download_url_base              = $livy::params::download_url_base,
  $download_extension             = $livy::params::download_extension,
  $version                        = $livy::params::version,
  $config_mode                    = $livy::params::config_mode,
  $livy_dir                       = $livy::params::livy_dir,
  $livy_bin_dir                   = $livy::params::livy_bin_dir,
  $livy_conf_dir                  = $livy::params::livy_conf_dir,
  $livy_user                      = $livy::params::livy_user,
  $init_style                     = $livy::params::init_style,
  $init_path                      = $livy::params::init_path,
  $service_name                   = $livy::params::service_name,
  $spark_home                     = $livy::params::spark_home,
  $hadoop_conf_dir                = $livy::params::hadoop_conf_dir,
  $conf_keystore                  = $livy::params::conf_keystore,
  $conf_keystore_password         = $livy::params::conf_keystore_password,
  $conf_server_host               = $livy::params::conf_server_host,
  $conf_server_port               = $livy::params::conf_server_port,
  $conf_server_sesison_timeout    = $livy::params::conf_server_session_timeout,
  $conf_impersonation_enabled     = $livy::params::conf_impersonation_enabled,
  $conf_jars                      = $livy::params::conf_jars,
  $conf_repl_jars                 = $livy::params::conf_repl_jars,
  $conf_pyspark_archives          = $livy::params::conf_pyspark_archives,
  $conf_sparkr_package            = $livy::params::conf_sparkr_package,
  $conf_file_local_dir_whitelist  = $livy::params::conf_file_local_dir_whitelist
  ) inherits livy::params {

  anchor { 'livy::begin': } ->
  class { '::livy::install': } ->
  class { '::livy::config': } ->
  class { '::livy::service': } ->
  anchor { 'livy::end': }

  #stuff goes here
}
