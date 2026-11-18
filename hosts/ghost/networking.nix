{
  networking = {
    hostName = "ghost";

    useNetworkd = true;
    nftables.enable = true;
    wireless.iwd.enable = true;
  };
}
