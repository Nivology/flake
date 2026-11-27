{
  outputs =
    { self, ... }@args:
    let
      inputs = (import ./.tack) { overrides = args.tackOverrides or { }; };
      inherit (inputs.nixpkgs) lib;

      treeOf =
        path:
        lib.fileset.toList (
          lib.fileset.fileFilter (file: file.hasExt "nix" && !(lib.hasPrefix "_" file.name)) ./${path}
        );
    in
    inputs.adios-flake.lib.mkFlake {
      inherit inputs self;
      systems = [ "x86_64-linux" ];

      flake = { withSystem, ... }: {
        nixosConfigurations = builtins.mapAttrs (
          hostname: _:
          withSystem "x86_64-linux" (
            { self', lib, ... }:
            lib.nixosSystem {
              specialArgs = { inherit inputs self'; };
              modules = [ self.nixosModules.default ] ++ treeOf "hosts/${hostname}";
            }
          )
        ) (builtins.readDir ./hosts);

        nixosModules.default = {
          _module.args = { inherit self; };
          imports = treeOf "modules/nixos";
        };

        hjemModules.default = {
          imports = treeOf "modules/hjem";
        };

        overlays.default = lib.composeManyExtensions (map import (treeOf "overlays"));

        templates = builtins.mapAttrs (language: _: {
          path = ./templates/${language};
          description = "A template for ${language}";
        }) (builtins.readDir ./templates);
      };
      perSystem =
        { inputs', pkgs, ... }:
        let
          pkgs' = pkgs.extend self.overlays.default;
        in
        {
          legacyPackages = pkgs';

          packages = lib.packagesFromDirectoryRecursive {
            callPackage = pkgs'.newScope inputs'.zen-browser;
            directory = ./pkgs;
          };

          devShells.default = pkgs'.callPackage ./shell.nix { };
          formatter = pkgs'.treefmt.withConfig (import ./ci/treefmt.nix { inherit pkgs lib; });
        };
    };
}
