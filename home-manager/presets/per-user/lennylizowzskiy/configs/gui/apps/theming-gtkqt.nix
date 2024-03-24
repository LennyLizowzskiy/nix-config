{ pkgs, ... }:

{
  home.packages = with pkgs; [

  ];

  fonts.fontconfig.enable = true;

  # home.pointerCursor = {
  #   gtk.enable = true;
  #   x11.enable = true;
  #   size = 32;

  #   name = "Phinger Cursors";
  #   package = pkgs.phinger-cursors;
  # };

  # qt = {
  #   enable = true;

  #   platformTheme = "kde";

  #   style = {
  #     package = with pkgs; [
  #       libsForQt5.breeze-qt5
  #     ];
  #     name = "Breeze Dark";
  #   };
  # };

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita-dark";
    };

    theme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };
}
