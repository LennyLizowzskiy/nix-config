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

    # crate2nix = {
    #   url = "github:nix-community/crate2nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.flake-parts.follows = "flake-parts";
    # };

    crane = {
      url = "github:ipetkov/crane?ref=v0.16.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs/stable";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland?ref=v0.38.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pyprland = {
      url = "github:hyprland-community/pyprland?ref=2.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:ViperML/nh";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    # hy3 = {
    #   url = "github:outfoxxed/hy3?ref=hl0.37.1";
    #   # inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.hyprland.follows = "hyprland";
    # };

    ironbar = {
      url = "github:JakeStanger/ironbar?ref=v0.14.1";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.rust-overlay.follows = "rust-overlay";
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nix-index-database.follows = "nix-index-database";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
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

          nix-alien = nix-alien.packages.${p.system}.nix-alien;

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
