{ inputs, pkgs, etcDir, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    autoEnable = true;

    base16Scheme = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/tinted-theming/schemes/ae4ce8b0d1f9b247d3add88a23aec3d833ae76d1/base16/ia-dark.yaml";
      sha256 = "1v9z2b3nq4rmc6ikf1magmqg7d6m2nwmizk33phkw6ld9c6y6xy0";
    };

    image = "${etcDir}/wallpapers/nix-wallpaper-nineish-dark-gray.png";

    cursor = {

    };

    fonts = {
      emoji = {
        package = pkgs.twitter-color-emoji;
        name = "Twitter Color Emoji";
      };

      monospace = {
        package = pkgs.hackgen-nf-font;
        name = "HackGen35 Console NF";
      };

      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };

      serif = {
        package = pkgs.libre-baskerville;
        name = "Libre Baskerville";
      };

      sizes = {
        terminal = 13;
      };
    };

    targets = {
      nixvim.enable = false;
    };
  };
}