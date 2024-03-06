stylixModule: { pkgs, etcDir, ... }:

let
  scheme = {
    slug = "githubDarkDefaultBase16";
    scheme = "GitHub Dark Default Base16";
    author = "Converted from GitHub theme for Neovim by projekt0n";

    base00 = "1F2937";
    base01 = "4B5563";
    base02 = "747F91";
    base03 = "C5CAD2";
    base04 = "5865F2";
    base05 = "A626A4";
    base06 = "7E8CD2";
    base07 = "9CA3AF";
    base08 = "F73859";
    base09 = "F59E0B";
    base0A = "EBCB8B";
    base0B = "A3BE8C";
    base0C = "5865F2";
    base0D = "B48EAD";
    base0E = "81A1C1";
    base0F = "E5E9F0";
  };
in
{
  imports = [
    # (if isNixOs then inputs.stylix.nixosModules.stylix else inputs.stylix.homeManagerModules.stylix)
    stylixModule
  ];

  stylix = {
    autoEnable = true;

    base16Scheme = scheme;

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
        terminal = 14;
      };
    };
  };
}
