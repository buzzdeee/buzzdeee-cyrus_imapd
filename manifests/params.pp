# Private class, do not use directly.
# The parameters that drive the module.

class cyrus_imapd::params {
  $imapd_conf_settings = {
    configdirectory                        => '/var/imap',
    partition-default                      => '/var/spool/imap',
    sievedir                               => '/var/sieve',
    sieve_extensions                       => 'fileinto reject vacation imapflags notify envelope relational regex subaddress copy',
    sieve_sasl_send_unsolicited_capability => '1',
    sieve_maxscriptsize                    => '128',
    admins                                 => 'cyrus',
    allowanonymouslogin                    => 'no',
    allowplaintext                         => 'yes',
    autocreatequota                        => '10000000',
    reject8bit                             => 'no',
    quotawarn                              => '90',
    timeout                                => '90',
    poptimeout                             => '10',
    dracinterval                           => '0',
    drachost                               => 'localhost',
    sasl_pwcheck_method                    => 'saslauthd',
    lmtpsocket                             => '/var/run/cyrus/socket/lmtp',
    lmtp_overquota_perm_failure            => 'no',
    lmtp_downcase_rcpt                     => 'yes',
    postuser                               => 'bb',
    tls_cert_file                          => '/etc/imapd/cert.pem',
    tls_key_file                           => '/etc/imapd/cert.key',
    tls_ca_file                            => '/etc/imapd/ca.pem',
    unixhierarchysep                       => 'yes',
  }
  $cyrus_conf_settings = {
# NOT YET
  }
  $service_name   = 'cyrus_imapd'
  $service_enable = true
  $service_ensure = 'running'
  $service_flags  = undef
  $package_name   = cyrus-imapd
  $package_ensure = 'installed'
  $package_flavor = undef
}
