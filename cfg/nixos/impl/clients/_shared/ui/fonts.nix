{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = false;

    packages = with pkgs; [
      ibm-plex

      # Monospace
      hackgen-nf-font # hackcjk (genjyuu-gothic) + nerd

      noto-fonts-lgc-plus
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      twitter-color-emoji

      # Unicode coverage
      unifont
      symbola

      # Metric-compatible fonts
      gyre-fonts
      caladea
      carlito

      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "IBM Plex Mono"
          "Noto Sans Mono CJK JP"
          "Symbols Nerd Font Mono"
          "Twitter Color Emoji"
        ];

        sansSerif = [
          "Noto Sans CJK JP"
          "IBM Plex Sans"
          "Noto Sans CJK JP"
          "Symbols Nerd Font"
          "Twitter Color Emoji"
        ];

        serif = [
          "IBM Plex Serif"
          "Noto Serif CJK JP"
          "Symbols Nerd Font"
          "Twitter Color Emoji"
        ];

        emoji = [ "Twitter Color Emoji" ];
      };
    };
  };
}
