{ self', ... }: {
  nixpkgs.pkgs = self'.legacyPackages;
}
