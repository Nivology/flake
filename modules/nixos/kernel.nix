{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "systemd.machine_id=firmware" ];
  };
}
