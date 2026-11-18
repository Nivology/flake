<div align=center>

# MisterKartoffel's Nix Flake
![NixOS Logo](.github/assets/nixos_logo_purple.png)

![Merge Queue](https://img.shields.io/github/actions/workflow/status/Nivology/flake/flake.yml?style=for-the-badge&logo=nixos&label=Builds&labelColor=%2324273a&color=%23a6da95) ![Update Inputs](https://img.shields.io/github/actions/workflow/status/Nivology/flake/tack.yml?style=for-the-badge&logo=nixos&label=Updates&labelColor=%2324273a&color=%23a6da95)
</div>

## Directory Structure Reference
```
flake/
├── .tack/                ◄ [1]
├── hosts/
│   └── <hostname>/
│       ├── default.nix
│       ├── disko.nix     ◄ [2]
│       └── ...
├── users/
│   └── <username>.nix    ◄ [3]
├── modules/
│   ├── hjem/             ◄ [3]
│   └── nixos/
│       ├── preservation/ ◄ [4]
│       ├── sops.nix      ◄ [5]
│       └── ...
├── pkgs/
│   ├── fish/
│   ├── nushell/
│   ├── nvim/
│   └── zen-browser/      ◄ [6]
├── overlays/
│   └── default.nix
├── ci/
│   ├── matrix.nix
│   ├── treefmt.nix
│   └── ...
├── default.nix           ◄ [7]
├── flake.nix
├── shell.nix
├── LICENSE
├── README.md
└── TODO.txt
```

## Notable modules and dependencies
#### [1] [manic-systems/tack](https://github.com/manic-systems/tack) - input pinning.
#### [2] [nix-community/disko](https://github.com/nix-community/disko) - declarative disk management.
#### [3] [feel-co/hjem](https://github.com/feel-co/hjem) - streamlined $HOME management.
#### [4] [nix-community/preservation](https://github.com/nix-community/preservation) - state persistence.
#### [5] [mic92/sops-nix](https://github.com/mic92/sops-nix) - declarative secret management.
#### [6] [youwen5/zen-browser-flake](https://github.com/youwen5/zen-browser-flake) - flake for Zen Browser.
#### [7] [NixOS/flake-compat](https://github.com/NixOS/flake-compat) - shim for flakeless consumers.

## Acknowledgments
- [Bvngee](https://github.com/bvngee) and [Soi](https://github.com/soulsoiledit), for being a part of TMC and indirectly exposing me to their Nix flakes.
- [EmergentMind](https://github.com/EmergentMind), for being a great reference both on YouTube and on GitHub when it comes to learning Nix and for showing the configuration structure from which I ultimately stole.
- The [niri & DMS](https://discord.gg/vT8Sfjy7sx) and [Ghostty](https://discord.gg/ghostty) Discord servers for many references.

<div align=center>
![it_aint_much](.github/assets/it_aint_much.jpg)
</div>
