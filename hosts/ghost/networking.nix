{
  networking = {
    hostName = "ghost";

    useNetworkd = true;
    nftables.enable = true;
    wireless.iwd.enable = true;

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
