# Private class, do not use directly.
# Takes care about the configuration files.

class cyrus_imapd::config (
  $cyrus_conf_settings,
  $imapd_conf_settings,
){
  file { '/etc/imapd.conf':
    owner   => '_cyrus',
    group   => '_cyrus',
    mode    => '0640',
    content => template('cyrus_imapd/imapd.conf.erb')
  }
  file { '/etc/cyrus.conf':
    owner   => '_cyrus',
    group   => '_cyrus',
    mode    => '0640',
    content => template('cyrus_imapd/cyrus.conf.erb')
  }
}
