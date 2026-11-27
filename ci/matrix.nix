let
  flake = builtins.getFlake (toString ../.);

  # Helper for merging information common to all jobs into each output.
  parse = drv: { inherit (drv) drvPath system; };
in
/*
  All entries are composed by the common attributes:
  - name: hostname, used in GitHub for jobs' names.
  - drvPath: host's derivation path.
  - system: architecture + kernel string, used to map builds to runners.
*/
builtins.concatMap
  (
    platform:
    map (name: (parse flake.${platform}.${name}.config.system.build.toplevel) // { inherit name; }) (
      builtins.attrNames (flake.${platform} or { })
    )
  )
  [
    "nixosConfigurations"
    "darwinConfigurations"
  ]
