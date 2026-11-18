{ pkgs, ... }: {
  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ehci_pci"
        "ahci"
        "usbhid"
        "sd_mod"
        "sr_mod"
      ];
      kernelModules = [ "amdgpu" ];
    };

    kernelModules = [ "kvm-intel" ];
  };

  hardware = {
    amdgpu.legacySupport.enable = true;
    cpu.intel.updateMicrocode = true;
    firmware = builtins.attrValues { inherit (pkgs) linux-firmware wireless-regdb; };
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
