{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      # Sans
      inter
      noto-fonts-cjk-sans

      # Serif
      noto-fonts-cjk-serif

      # Monospace
      hackgen-nf-font # hackcjk (genjyuu-gothic) + nerd
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
          "CommitMono"
        ];
      })
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif CJK JP" ];
        sansSerif = [
          "Noto Sans CJK JP"
          "Inter"
        ];
        monospace = [ "HackGen35 Console NF" ];
      };
    };
  };
}
