{
  networking.nameservers = [
    "1.1.1.2#security.cloudflare-dns.com"
    "9.9.9.9#tls://dns.quad9.net"
    "8.8.8.8#dns.google"
  ];
}
