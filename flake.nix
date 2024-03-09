{
  description = "liz's nix configuration";

  inputs = {
    flake-utils.url = github:numtide/flake-utils;

    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    nixpkgs-stable.url = github:nixos/nixpkgs/nixos-23.11;
    nixpkgs-unfree = {
      url = github:numtide/nixpkgs-unfree;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    personalPkgs = {
      url = github:LennyLizowzskiy/nix-repo;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = github:NixOS/nixos-hardware;

    stylix = {
      url = github:danth/stylix;
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    rust-overlay = {
      url = github:oxalica/rust-overlay;
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    android-nixpkgs = {
      url = github:tadfisher/android-nixpkgs/stable;
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, ... }@inputs: with inputs;
    let
      sharedOverlays = [
        android-nixpkgs.overlays.default
        rust-overlay.overlays.default
        
        (f: p: {
          stable = inputs.nixpkgs-stable.legacyPackages.${p.system};
          unfree = inputs.nixpkgs-unfree.legacyPackages.${p.system};
        })
      ];
    in
    {
      nixosConfigurations =
        let
          mkNixOsConf = {
            args ? {},
            modules ? [],
            enableGui ? false,
          }: with inputs;
            nixpkgs.lib.nixosSystem {
              specialArgs = {
                inherit inputs enableGui;

                # etc = import ./etc;
                etcDir = ./etc;
                shared = import ./_shared;
                sharedDir = ./_shared;
                rootDir = ./.;
              } // args;

              modules = [
                ({ ... }: {
                  nixpkgs.overlays = [
                    (f: p: {
                      nixos-rebuild = f.stable.nixos-rebuild;
                    })
                  ] ++ sharedOverlays;
                })
              ] ++ modules;
            };
        in
        {
          grogoroth = mkNixOsConf {
            enableGui = true;

            modules = [
              ./nixos/presets/per-machine/grogoroth
            ];
          };

          rher = mkNixOsConf {
            enableGui = true;

            modules = [
              ./nixos/presets/per-machine/rher
            ];
          };
        };
    };
}
