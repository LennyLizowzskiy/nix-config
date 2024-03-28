{
  description = "liz's nix configuration";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
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
      inputs.flake-utils.follows = "flake-utils";
    };

    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs/stable";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland?ref=v0.37.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hy3 = {
      url = "github:outfoxxed/hy3?ref=hl0.37.1";
      # inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprland.follows = "hyprland";
    };

    ironbar = {
      url = "github:JakeStanger/ironbar?ref=v0.14.1";
      inputs.nixpkgs.follows = "nixpkgs";
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

          neovim-nightly = neovim-nightly.packages.${p.system}.default;

          stable = nixpkgs-stable.legacyPackages.${p.system};
          unfree = nixpkgs-unfree.legacyPackages.${p.system};
        })
      ];
    in
    {
      nixosConfigurations =
        let
          mkNixOsConf =
            {
              hostname,
              args ? { },
              modules ? [ ],
              enableGui ? false,
            }:
            with inputs;
            nixpkgs.lib.nixosSystem {
              specialArgs = {
                inherit inputs enableGui;

                hostname = hostname;

                etc = import ./etc;
                etcDir = ./etc;
                shared = import ./_shared;
                sharedDir = ./_shared;
                rootDir = ./.;
              } // args;

              modules = [
                (
                  { ... }:
                  {
                    nixpkgs.overlays = [
                      (f: p: {

                      })
                    ] ++ sharedOverlays;

                    nixpkgs.config.permittedInsecurePackages = [ "nix-2.16.2" ];
                  }
                )
              ] ++ modules;
            };
        in
        {
          grogoroth = mkNixOsConf {
            hostname = "grogoroth";
            enableGui = true;

            modules = [ ./nixos/presets/per-machine/grogoroth ];
          };

          rher = mkNixOsConf {
            hostname = "rher";
            enableGui = true;

            modules = [ ./nixos/presets/per-machine/rher ];
          };
        };
    };
}
