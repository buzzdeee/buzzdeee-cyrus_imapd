# == Class: cyrus_imapd
#
# Full description of class cyrus_imapd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'cyrus_imapd':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Sebastian Reitenbach <sebastia@l00-bugdead-prods.de>
#
# === Copyright
#
# Copyright 2014 Sebastian Reitenbach, unless otherwise noted.
#
class cyrus_imapd (
  $override_imapd_conf_settings = $cyrus_imapd::params::imapd_conf_settings,
  $override_cyrus_conf_settings = $cyrus_imapd::params::cyrus_conf_settings,
  $package_name   = $cyrus_imapd::params::package_name,
  $package_ensure = $cyrus_imapd::params::package_ensure,
  $package_flavor = $cyrus_imapd::params::package_flavor,
  $service_name   = $cyrus_imapd::params::service_name,
  $service_enable = $cyrus_imapd::params::service_enable,
  $service_ensure = $cyrus_imapd::params::service_ensure,
  $service_flags  = $cyrus_imapd::params::service_flags,
) inherits cyrus_imapd::params {

  class { 'cyrus_imapd::install':
    package_name   => $package_name,
    package_ensure => $package_ensure,
    package_flavor => $package_flavor,
  }

  $cyrus_conf_settings = deep_merge($cyrus_imapd::params::cyrus_conf_settings, $override_cyrus_conf_settings)
  $imapd_conf_settings = deep_merge($cyrus_imapd::params::imapd_conf_settings, $override_imapd_conf_settings)

  class { 'cyrus_imapd::config':
    cyrus_conf_settings => $cyrus_conf_settings,
    imapd_conf_settings => $imapd_conf_settings,
  }

  class { 'cyrus_imapd::service':
    service_name   => $service_name,
    service_ensure => $service_ensure,
    service_enable => $service_enable,
    service_flags  => $service_flags,
  }

  Class['cyrus_imapd::install'] ->
  Class['cyrus_imapd::config']  ~>
  Class['cyrus_imapd::service']
}
