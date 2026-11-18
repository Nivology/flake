{
  networking = {
    nameservers = [
      "1.1.1.2#security.cloudflare-dns.com"
      "9.9.9.9#tls://dns.quad9.net"
      "8.8.8.8#dns.google"
    ];

    bonds.bond0 = {
      interfaces = [
        "enp7s0"
        "wlan0"
      ];

      driverOptions = {
        mode = "active-backup";
        primary_reselect = "better";
        miimon = "100";
      };
    };

    interfaces.bond0.macAddress = "06:F7:E2:F0:75:74";
  };
}
