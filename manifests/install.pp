# Private class, do not use directly.
# Takes care about the package.

class cyrus_imapd::install (
  $package_name,
  $package_ensure,
  $package_flavor,
) {

  package { $package_name:
    ensure => $package_ensure,
    flavor => $package_flavor,
  }
}
