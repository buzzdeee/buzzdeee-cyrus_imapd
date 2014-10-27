class cyrus_imapd::service (
  $service_name,
  $service_ensure,
  $service_flags,
  $service_enable,
) {
  service { $service_name:
    ensure => $service_ensure,
    enable => $service_enable,
    flags  => $service_flags,
  }
}
