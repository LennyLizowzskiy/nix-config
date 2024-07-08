{
  description = "liz's nix configuration";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    # nixpkgs-master.url = "github:nixos/nixpkgs";
    nixpkgs-unfree = {
      url = "github:numtide/nixpkgs-unfree";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    personalPkgs = {
      url = "github:LennyLizowzskiy/nix-repo";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-ez-flake = {
      url = "github:name-snrl/nixos-ez-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    crane = {
      url = "github:ipetkov/crane?ref=v0.16.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs/stable";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pyprland = {
      url = "github:hyprland-community/pyprland?ref=2.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ironbar = {
      url = "github:JakeStanger/ironbar?ref=v0.14.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nix-index-database.follows = "nix-index-database";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zjstatus = {
      url = "github:dj95/zjstatus";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.crane.follows = "crane";
      inputs.rust-overlay.follows = "rust-overlay";
      inputs.flake-utils.follows = "flake-utils";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    { self, ... }@inputs:
    with inputs;
    let
      sharedOverlays = [
        android-nixpkgs.overlays.default
        rust-overlay.overlays.default

        (f: p: {
          clang = p.lib.hiPrio p.clang; # fix collisions with gcc

          nix-alien = nix-alien.packages.${p.system}.nix-alien;

          stable = nixpkgs-stable.legacyPackages.${p.system};
          unfree = nixpkgs-unfree.legacyPackages.${p.system};
          master = nixpkgs-master.legacyPackages.${p.system};

          nix = f.stable.nix;
          nixos-rebuild = f.stable.nixos-rebuild;
        })
      ];
    in
    {
      nixosConfigurations =
        let
          mkNixOsConf =
            {
              args ? { },
              modules ? [ ],
            }:
            with inputs;
            nixpkgs.lib.nixosSystem {
              specialArgs = {
                inherit inputs;
                wallpapersDir = ./misc/wallpapers;
                keysDir = ./misc/keys;
                themesDir = ./misc/themes;
                rootDir = ./.;
                externalDir = ./misc/external;
              } // args;

              modules = [
                home-manager.nixosModules.home-manager
                ./cfg/nixos/modules/local.nix
                ./main.nix

                (
                  { ... }:
                  {
                    nixpkgs.overlays = sharedOverlays;
                  }
                )
              ] ++ modules;
            };
        in
        {
          grogoroth = mkNixOsConf { modules = [ ./cfg/nixos/impl/clients/grogoroth ]; };

          rher = mkNixOsConf { modules = [ ./cfg/nixos/impl/clients/rher ]; };
        };
    };
}
