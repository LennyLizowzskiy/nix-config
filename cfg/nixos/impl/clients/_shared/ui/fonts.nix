{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = false;

    packages = with pkgs; [
      (pkgs.stdenv.mkDerivation {
        name = "lilex-font";
        version = "2.600";

        allowSubstitutes = false;

        src = pkgs.fetchzip {
          url = "https://github.com/mishamyrt/Lilex/releases/download/2.600/Lilex.zip";
          sha256 = "sha256-vmXityBoSquGfvEXn1Iohq4Skojbfm48+PrzR12ZYMw=";
          stripRoot = false;
        };

        installPhase = /* bash */''
          mkdir -p $out/share/fonts/truetype/Lilex
          cp "./variable/Lilex[wght].ttf" $out/share/fonts/truetype/Lilex
        '';

        meta = {
          description = "An extended fork of IBM Plex Mono font";
          license = pkgs.lib.licenses.ofl;
        };
      })
      ibm-plex
      plemoljp # plex mono for jp lang

      # ricty # jp mono
      # route159 # jp sans

      ccsymbols

      noto-fonts-lgc-plus
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif

      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji
      # twitter-color-emoji

      # Unicode coverage
      unifont
      symbola
      ucs-fonts # bitmap unicode

      # Metric-compatible fonts
      gyre-fonts
      caladea
      carlito

      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "Lilex"
          "PlemolJP35"
          "Noto Sans Mono CJK JP"
          "Symbols Nerd Font Mono"
          "Noto Emoji"
        ];

        sansSerif = [
          "IBM Plex Sans"
          "IBM Plex Sans JP"
          "IBM Plex Sans KR"
          "IBM Plex Sans TC"
          "Noto Sans CJK JP"
          "Symbols Nerd Font"
          "Noto Color Emoji"
          "CCSymbols"
        ];

        serif = [
          "IBM Plex Serif"
          "Noto Serif CJK JP"
          "Symbols Nerd Font"
          "Noto Color Emoji"
          "CCSymbols"
        ];

        emoji = [
          "Noto Color Emoji"
          "CCSymbols"
        ];
      };
    };
  };
}
