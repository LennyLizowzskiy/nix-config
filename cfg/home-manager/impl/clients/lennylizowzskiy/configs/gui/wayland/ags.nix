{ inputs, pkgs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  home.packages = with pkgs; [
    brightnessctl

  ];

  programs.ags = {
    enable = true;

    extraPackages = with pkgs; [
      libdbusmenu-gtk3
      gnome.gnome-bluetooth
      brightnessctl
      gtksourceview
      accountsservice
      webkitgtk
    ];
  };
}
